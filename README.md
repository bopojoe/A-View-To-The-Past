# A-View-To-The-Past

## Introduction

This is a prototype of my final year project "A View To The Past"

This project is to show the main functionality of my application, 

The application is built as an Augmented reality application that that produces an AR model over a pre-existing structure,
and thus would show you what the structure looked like when it was new.

The models are downloaded on demand when you launch the AR preview.

## The Application

This Version of the Application has been ripped apart and put back together over weeks of debugging to find where the carsh issue was,

The current application has 2 simple test models and a single model that was built in blender and with textures aquired from unity the model was exported to .gltf (3D VR/AR model file),
the .gltf model file was then converted to the usdz file format using reality converter. This program, built by Apple, converts the most common model types to their usdz standard that can then be
exported as a usdz model. 

With this model you can then import it into reality composer (An Apple application used to create AR ready models that can be viewed in their quick view module)
and inside that application you can create your AR experience.

This experience can be exported as an RCproject file (for static use) or as a reality file that can be dynamically called and downloaded when needed.

The other parts of the application have been hardcoded to show the possibilities of the application, once everything is working correctly
