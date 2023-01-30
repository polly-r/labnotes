# Lab Notes

### QGIS - Cartographic skills
#### Tips

- Present insights, not data.
- Be cognisant of your audience.

Image | Tip
-|-
![QGIS1](screenshots/OSM_bkgrounds.jpg) | The geographic coordinate system tells us where the data is located on the earth's surface and the projected coordinate system tells the data how to draw on a flat surface, like on a paper map or a computer screen.
![QGIS2](screenshots/QGIS_tip1.48.png) | When styling labels, do not use both a shadow and buffer. Choose one to keep the map simple.

#### Procedures
Adding an inset map:
Step | Image | Description
-|-|-
1 | ![QGIS1](screenshots/QGIS_addStyle.00.png) | Once you have completed your main map, Add a new style and name it _main_. This will save your current layout and allow us to start the inset map style.
2 | ![QGIS2](screenshots/QGIS_addStyle2.png) | Style this layer with a simple solid fill and no pen stroke style. Apply.
3 | ![QGIS3](screenshots/QGIS_addStyle3.png) | Now click on the Theme Manager eye icon and Add Theme. Name this theme overview and click 'OK' to save it.
4 | ![QGIS4](screenshots/QGIS_addStyle4.png) | Open a New Print Layout (cmd+P/alt+P) and 'Add Map' for the main map. Repeat this for the second map. Finally, under Item Properties > Layers, choose _overview_ as the map theme to follow for the second map.

Making a simple flagmap:
Step | Image | Tip
-|-|-

### GitHub
- Forking a GitHub repository 

Image | Tip
-|-
![GIT1](screenshots/fork.png) | On the GitHub site, click on 'Fork'. Leave the details unchanged and click 'Create Fork'.

- Cloning a forked repo using VS Code

Image | Tip
-|-
![GIT1](screenshots/ForkedHandbook.png) | Open the Command Palette and type 'Git', select 'Clone', choose 'Clone from GitHub' and select the forked repo.
![GIT1](screenshots/ForkedHandbook2.png) | There you have it! Your forked repository cloned.


_
### OpenStreetMap
[OSM](https://www.openstreetmap.org/)

Upon signing in, choose to Edit with iD to edit in the browser.  
Image | Description
-|-
![OSM1](screenshots/OSM_bkgrounds.jpg) | The OSM interface allows you to choose to between different terrain and satellite basemaps/backgrounds to help map more accurately. Ensuring that an oscurity in one basemap can be abated when changing to another.
![OSM2](screenshots/OSM_attributes.png) | Upon digitising your point, line or polygon, Edit Feature allows adding attributes to your data. 
![OSM3](screenshots/OSM_HOT.png) | Using the same OSM account, you can contribute to the Humanitarian OpenStreetMap Team (HOT) projects to help scholars and developers throughout the world. The more accurate edits, the higher your score and the more reliable you are considered to be.
