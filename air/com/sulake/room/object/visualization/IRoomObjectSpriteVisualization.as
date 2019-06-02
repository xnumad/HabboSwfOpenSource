//com.sulake.room.object.visualization.IRoomObjectSpriteVisualization

package com.sulake.room.object.visualization{
    public /*dynamic*/ interface IRoomObjectSpriteVisualization extends IRoomObjectGraphicVisualization {

        function get spriteCount():int;
        function getSprite(k:int):IRoomObjectSprite;
        function hasAnimationFrames():Boolean;
        function forceCPUSpriteHandling():void;

    }
}//package com.sulake.room.object.visualization

