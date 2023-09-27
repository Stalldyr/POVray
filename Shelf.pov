#version 3.7;
global_settings { assumed_gamma 1.2 } 

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"


//--------------------------------------------------------------------------
//---------------------------- Cameras & lighting---------------------------
//--------------------------------------------------------------------------
  


#declare Camera0 = camera {
   location <-4, 22, -13>
   angle 45 // direction <0, 0,  1.7>
   right x*image_width/image_height
   look_at <0,0,0>
}

#declare Camera1 = camera {
   location <-4, 23, -14>
   angle 60 // direction <0, 0,  1.7>
   right x*image_width/image_height
   look_at <0,0,0>
}

#declare Camerax = camera {
   location <-25, 3,3>
   right x*image_width/image_height
   look_at <0,0,5>
}

#declare Cameray = camera {
   location <0, 20, 0>
   right x*image_width/image_height
   look_at <0,0,0>
}

#declare Cameraz = camera {
   location <0, 00, -10>
   right x*image_width/image_height
   look_at <0,0,0>
}


//Uncomment the area lights only if you've got lots of time.
#declare Dist=80.0;
light_source {<50, 25, -50> color White
     fade_distance Dist fade_power 2
//   area_light <40, 0, -40>, <-40, 0, 40>, 3, 3
//   adaptive 1
//   jitter
}
light_source {<-50, 10,  -4> color Gray30
     fade_distance Dist fade_power 2
//   area_light <-20, 0, -20>, <20, 0, 20>, 3, 3
//   adaptive 1
//   jitter
}
light_source {< 0, 100,  0> color Gray30
     fade_distance Dist fade_power 2
//   area_light <-30, 0, -30>, <30, 0, 30>, 3, 3
//   adaptive 1
//   jitter
}


//--------------------------------------------------------------------------
//---------------------------- Background ----------------------------
//--------------------------------------------------------------------------

background {rgb<0.7, 0.7, 0.7>}

plane{
    z,5.2 
    pigment{rgb<0.7, 0.7, 0.7>} 
    normal { bozo 0.5 scale 0.10 } 
        //finish { phong 1 reflection{ 0.05 }
}


//--------------------------------------------------------------------------
//---------------------------- Textures ----------------------------
//--------------------------------------------------------------------------


#declare Blue_Agate_Map2 =
color_map {
    [0.5  rgb <0.30, 0.30, 0.50>]
    [0.55 rgb <0.20, 0.20, 0.30>]
    [0.6  rgb <0.25, 0.25, 0.35>]
    [0.7  rgb <0.15, 0.15, 0.26>]
    [0.8  rgb <0.10, 0.10, 0.20>]
    [0.9  rgb <0.30, 0.30, 0.50>]
    [1.0  rgb <0.10, 0.10, 0.20>]
}

#declare Red_Agate_Map_in =
color_map {
    [0.5  rgb <0.45, 0.20, 0.30>]
    [0.55 rgb <0.35, 0.10, 0.10>]
    [0.6  rgb <0.40, 0.15, 0.15>]
    [0.7  rgb <0.30, 0.05, 0.06>]
    [0.8  rgb <0.25, 0.0, 0.0>]
    [0.9  rgb <0.30, 0.30, 0.30>]
    [1.0  rgb< 0.25, 0.0, 0.0>]
}

#declare Red_Agate_Mapr =
color_map {
    [0.6  rgb <0.18, 0.05, 0.06>]
    //[0.7 rgb <0.35, 0.10, 0.10>]
    [0.55  rgb <0.45, 0.20, 0.30>]
    [0.5  rgb <0.40, 0.15, 0.15>]
    [0.7 rgb <0.35, 0.10, 0.10>]
    [0.8   rgb <0.30, 0.05, 0.06>]
    //[0.7  rgb <0.25, 0.0, 0.0>]
    [0.9  rgb <0.3, 0.15, 0.2>]
    [1  rgb<0.18, 0.05, 0.06>]
}

#declare Red_Agate_Map =
color_map {
    [0.6  rgb <0.18, 0.05, 0.06>]
    //[0.7 rgb <0.35, 0.10, 0.10>]
    [0.55  rgb <0.45, 0.20, 0.30>]
    //[0.5  rgb <0.40, 0.15, 0.15>]
    //[0.7 rgb <0.35, 0.10, 0.10>]
    //[0.8   rgb <0.30, 0.05, 0.06>]
    //[0.7  rgb <0.25, 0.0, 0.0>]
    [0.9  rgb <0.3, 0.15, 0.2>]
    [1  rgb<0.18, 0.05, 0.06>]
}



#declare Red_Agate = 
pigment {
    agate
    //marble
    color_map { Red_Agate_Map }
    //turbulence 0.3
}





#declare M_Wood18B =
colour_map {
    [0.00 0.25   color rgbf < 0.50, 0.26, 0.12, 0.10>
                 color rgbf < 0.54, 0.29, 0.13, 0.20>]
    [0.25 0.40   color rgbf < 0.54, 0.29, 0.13, 0.20>
                 color rgbf < 0.55, 0.28, 0.10, 0.70>]
    [0.40 0.50   color rgbf < 0.55, 0.28, 0.10, 0.70>
                 color rgbf < 0.50, 0.23, 0.15, 0.95>]
    [0.50 0.70   color rgbf < 0.50, 0.23, 0.15, 0.95>
                 color rgbf < 0.56, 0.29, 0.17, 0.70>]
    [0.70 0.98   color rgbf < 0.56, 0.29, 0.17, 0.70>
                 color rgbf < 0.54, 0.29, 0.13, 0.20>]
    [0.98 1.00   color rgbf < 0.54, 0.29, 0.13, 0.20>
                 color rgbf < 0.50, 0.26, 0.12, 0.10>]
}

#declare GinTexture2 = material {
  texture {
    pigment {
      color rgbt <1, 1, 1, 1>
    }
    finish {
      ambient 0.0
      diffuse 0.0

      reflection {
        0.0, 1.0
        fresnel on
      }

      specular 0.4
      roughness 0.003
    }
  }
  interior {
    ior 1.3
  }
}

#declare GinTexture = material{
  texture{
    pigment{ rgbf<.93,.95,.98,0.825>*0.99}
    finish { ambient 0.0 diffuse 0.15
             reflection{0.1,0.1 fresnel on}
             specular 0.6 roughness 0.005
             conserve_energy
             
             specular 0.4
            roughness 0.003
           } // end finish
  } // end of texture

  interior{ ior 1.33
             //fade_power 1001
             //fade_distance 0.5
             //fade_color <0.8,0.8,0.8>
             caustics 0.16
   } // end of interior
 } // end of material


//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------


//-------------------
//-------Shelf-------
//-------------------

#declare Shelf_Texture =
    texture { pigment { P_WoodGrain18A color_map { M_Wood18A }}}
    texture { pigment { P_WoodGrain12A color_map { M_Wood18B }}}
    texture {
        pigment { P_WoodGrain12B color_map { M_Wood18B }}
        finish { reflection 0.02}
    }



#declare ShelfTop = 
box {<-12,0,-5.2>, <12,-0.5,5.2>
    texture { Shelf_Texture
        //scale 0.5
        rotate y*90
        //rotate <10, 0, 15>
        //translate z*4
    }
}

#declare ShelfBottom = 
box {<-11,-2,0>, <11,-5.5,0.5>
    texture { Shelf_Texture
        //scale 0.5
        rotate y*90
        //rotate <10, 0, 15>
        //translate z*4
    }
    translate -5*z
}

//------------------------
//-------MetalBars--------
//------------------------


#declare MetalBars = cylinder{
<0,-5>
<0,5>
0.1
texture { T_Copper_1B
//normal { bumps 0.5 scale 0.15} 
    finish { phong 1}
}
}


#declare MetalBarsAngle = object{
#declare bend_start = 0.8;
#declare bend_smoothness = 2;
#declare bend_angle = 50;
#declare bend_object = object {MetalBars translate 4.4*y}
                            
#include "bend.inc"
}

#declare MetalBarsWall = object{
#declare bend_start = 0.8;
#declare bend_smoothness = 2;
#declare bend_angle = 130;
#declare bend_object = object {MetalBars translate 3*y}
                            
#include "bend.inc"
}


#declare ShelfBars = 
merge{
    object{MetalBarsAngle
        rotate -90*y
        translate <0,0,-2>
    }

    object{MetalBarsWall 
        rotate <180,90,0>
        rotate 230*x
        translate <0,6.2,4.4>
    }
}


//-------------------
//-------Book--------
//-------------------



#declare BookCover =union{
text {
        ttf "timrom.ttf" "JEAN-PAUL" 0.0, 0
        pigment { White }
        finish { reflection .25 specular 1 }
        //translate 0.3*z
        translate <-2.5,3.7,-0.005>
        scale <0.35,0.5,0>
}
text {
        ttf "timrom.ttf" "SARTRE" 0.0, 0
        pigment { White }
        finish { reflection .25 specular 1 }
        //translate 0.3*z
        translate <-1.8,2.7,-0.005>
        scale <0.35,0.5,0.5>
}
text {
        ttf "timrom.ttf" "KVALMEN" 0.0, 0
        pigment { White }
        finish { reflection .25 specular 1 }
        //translate 0.3*z
        scale <0.25,0.25,0>
        translate <-0.6,0.7,-0.005>
        
}
}
  

#declare BookBase = 
box {<-2.5,-4,0>, <2.5,4,0.4>          
              texture { pigment{Red_Agate}
                   // normal { bumps 0.5 scale 0.05}
                   finish { phong 1 } 
                   scale 0.5
                 } // end of texture
    //translate<0,0.5,-7> rotate<0,-30,0>
   
}


#declare BlackRectangle = 
box {<-1.1,-0.7,-0.0>, <1.1,2.7,-0.000001>          
              texture { pigment{Black}
                   // normal { bumps 0.5 scale 0.05}
                   finish { phong 1 } 
                   scale 0.5
                 } // end of texture
     
    //rotate<0,-30,0>
    } 
    
    
#declare WhiteLine =     
box {<-0.015,-1.6,0>, <0.015,1.6,0>
    //<0,0,0> <0.03,1,0>
    texture { pigment{White}
                   // normal { bumps 0.5 scale 0.05}
                   finish { phong 1 } 
                   scale 0.5
                 } // end of texture
    translate -0.000005*z
    }
 
#declare Book = 
union{
    object{BookCover}
    object{BookBase}
    object{BlackRectangle}
    object{WhiteLine translate <-1,1,0> }
    object{WhiteLine translate <1,1,0>}
    object{WhiteLine rotate 90*z scale 0.63 translate <0,2.6,0>}
    object{WhiteLine rotate 90*z scale 0.63 translate <0,-0.6,0>}
}


//-------------------
//-------Vase--------
//-------------------


#declare VaseRadius = 1;
#declare VaseThickness = 0.9;


#declare Vase = difference{
 sor {
  8,
  <VaseRadius,0>
  <VaseRadius,0>
  <VaseRadius,2>
  <VaseRadius,3>
  <.5*VaseRadius,4>
  <VaseRadius,5>
  <VaseRadius,6>
  <VaseRadius,6>
  
}
sor {
  10,
  <0,0.2>
  <0,0.2>
  <VaseRadius*VaseThickness,0.4>
  <VaseRadius*VaseThickness,0.4001>
  <VaseRadius*VaseThickness,2>
  <VaseRadius*VaseThickness,3>
  <.5*VaseRadius*VaseThickness,4>
  <VaseRadius*VaseThickness,5>
  <VaseRadius*VaseThickness,6.1>
  <VaseRadius*VaseThickness,6>
}

scale <1,1.4,1>

material{ texture { NBwinebottle }
                   interior{ I_Glass } 
  }
}



//-------------------------
//-------Gin Bottle--------
//-------------------------


#declare GinSize = 6;
#declare GinHeight = 16;
#declare BottleThickness = 0.4;                

#declare GinBottleBase = 
prism {
    linear_sweep
    linear_spline
    0, // sweep the following shape from here ...
    1 //GinHeight, // ... up through here
    7, // the number of points making up the shape ...
    
    #for (i, 0, 6, 1)
        (GinSize)*<cos(2*pi*i/6),sin(2*pi*i/6)>
    #end
}            

#declare BottleSides = box{ <(GinSize-BottleThickness)*cos(2*pi/6),BottleThickness,(GinSize-BottleThickness)*sin(2*pi/6)>, <(GinSize+BottleThickness)*cos(4*pi/6),GinHeight-BottleThickness,(GinSize+BottleThickness)*sin(4*pi/6)>}
#declare HOBottleEdges = cylinder{<GinSize*cos(2*pi/6),0,GinSize*sin(2*pi/6)>,  <GinSize*cos(4*pi/6),0,GinSize*sin(4*pi/6)>, BottleThickness }
#declare VEBottleEdges = cylinder{<GinSize*cos(2*pi/6),BottleThickness,GinSize*sin(2*pi/6)>,  <GinSize*cos(2*pi/6),GinHeight-BottleThickness,GinSize*sin(2*pi/6)>, BottleThickness }
#declare BottleCorners = sphere { <GinSize*cos(2*pi/6),0,GinSize*sin(2*pi/6)>, BottleThickness }                                            


#declare BottleSide =
union {
    object{BottleSides}
    object{VEBottleEdges}
    object{HOBottleEdges translate <0,BottleThickness,0>}
    object{HOBottleEdges translate <0,GinHeight - BottleThickness,0>}
    object{BottleCorners translate <0,BottleThickness,0>}
    object{BottleCorners translate <0,GinHeight-BottleThickness,0>}
}

#declare BottleConeOuter = 
prism {
    conic_sweep
    linear_spline
    0.3, // sweep the following shape from here ...
    1, // ... up through here
    7, // the number of points making up the shape ...
    
    #for (i, 0, 6, 1)
        (GinSize)*<cos(2*pi*i/6),sin(2*pi*i/6)>
    #end
    
    rotate <180, 0, 0>
    translate <0,1,0>
    scale 2*y
}

#declare BottleConeInner = 
prism {
    conic_sweep
    linear_spline
    0.1499, // sweep the following shape from here ...
    1, // ... up through here
    7, // the number of points making up the shape ...
    
    #for (i, 0, 6, 1)
        (GinSize)*<cos(2*pi*i/6),sin(2*pi*i/6)>
    #end
    
    rotate <180, 0, 0>
    translate <0,1,0>
    scale 2*y
}

#declare BottleCone = difference{ object{BottleConeOuter} object{BottleConeInner translate -0.3*y scale <0.9,1,0.9>}}
                                                                     

#declare GinBottle2 = 
merge{
        object{GinBottleBase}
        object{BottleCone translate (GinHeight)*y}
        #for (i, 0, 5, 1)
            object{BottleSide rotate <0,60*i,0>}
            
        #end 
        //scale 0.5
        material{ texture { NBglass } interior{ I_Glass } }
        //pigment{Green filter 0.9}
}


#declare GinLiquid =
prism {
    linear_sweep
    linear_spline
    BottleThickness, // sweep the following shape from here ...
    10 //GinHeight, // ... up through here
    7, // the number of points making up the shape ...
    
    #for (i, 0, 6, 1)
        (GinSize-BottleThickness)*<cos(2*pi*i/6),sin(2*pi*i/6)>
    #end 
    //scale 0.4999
    material { GinTexture }
} 


#declare GinBottle = 
difference{object{GinBottle2 } object{GinBottle2  scale <0.9,0.9,0.9>}
material{ texture { NBglass } interior{ I_Glass } }
}


#declare GinLabel = union{
box{<0,0,0><1,1,0>
    pigment{White}
    }

box{<0,0,0>,<1,1,0>
    pigment{
    image_map
        { png "Roku-Logo.png"
          map_type 0
        }
    }
    translate -0.001*z
    }
}


#declare Cork = union{
object{BottleConeOuter 
rotate 180*x 
scale 1.5*y
scale 0.3 
}
object{GinBottleBase
scale <0.3,1.5,0.3>

}
object{BottleConeOuter 
scale 1.5*y
scale 0.3
translate 1.5*y 
}


material{ texture { NBglass } interior{ I_Glass } }
}


#declare BottleWithGin = 
union{object{GinBottle2}
object{GinLiquid scale 0.999}
object{GinLabel scale 5 translate <-2.5,7,-GinSize+BottleThickness>}
object{Cork translate (GinHeight+2)*y}
scale 0.4
}


//-------------------------
//---------Photos----------
//-------------------------


#declare BirdPhoto =                
box{<0,0,0>,<1,1,0>
    pigment{
    image_map
        { jpeg "Birds.jpg"
          map_type 0
        }
    }
    translate -0.001*z
    scale 3.5
    }


#declare TerrainPhoto =                
box{<0,0,0>,<1,1,0>
    pigment{
    image_map
        { jpeg "Terrain.jpg"
          map_type 0
        }
    }
    translate -0.001*z
    scale 3.5
    }


          
//--------------------------------------------------------------------------
//---------------------------- Scene ---------------------------------------
//--------------------------------------------------------------------------
camera{Camera1}


#declare Shelf = union{
    object{ShelfTop}
    object{ShelfBottom translate 2*y}
    object{ShelfBars translate -11.5*x}
    object{ShelfBars translate 11.5*x}
}


object{Shelf}
object{Book rotate <90,0,0> translate <0,0.4,0> rotate 50*y  translate <3,0,-2>}                                                                    
object{Vase scale 0.8 translate <6,0,4>}
object{BottleWithGin rotate -40*y translate -6*x}


object{BirdPhoto translate <-1,2,5.2>}
object{TerrainPhoto translate <-6.5,4,5.2>}
