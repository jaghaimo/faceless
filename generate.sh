#!/usr/bin/env bash

## Step 0
# Sanity checks
if [ ! -f faction.list ]; then
    echo "Generate faction.list first - run this in a Starsector folder:"
    echo "# find . -name "*.faction" -printf '%f\n' | cut -f1 -d. | sort | uniq > faction.list"
    exit 1;
fi
if [ ! -f player.faction ]; then
    echo "Provide player.faction - pick one from a base game or a mod."
    exit 1;
fi

## Step 1
# Make all factions use the template (remove factions you don't want changed from `factions.list`)
rm -rf data
mkdir -p data/world/factions
for F in `cat faction.list`
do
    cp template.faction data/world/factions/$F.faction
done

## Step 2
# Make a new mod that you will need to install
ID=$(jq -r .id mod_info.json)
VERSION=$(jq -r .version mod_info.json)
RELEASE=$ID-$VERSION
rm -rf $ID
mkdir $ID
cp -R data/ graphics/ $ID/
cp mod_info.json $ID/
rm -f $RELEASE.zip
zip -r $RELEASE.zip $ID
rm -rf $ID

## Step 3
# Same as step 1 but spread your picked portrait mod across (provide player.faction)
rm -rf data
mkdir -p data/world/factions
for F in `cat faction.list`
do
    cp player.faction data/world/factions/$F.faction
done

## Step 4
# Now copy `data` into your portrait mod of choice
