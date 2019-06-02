//com.sulake.room.object.visualization.IRoomObjectVisualization

package com.sulake.room.object.visualization{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public /*dynamic*/ interface IRoomObjectVisualization {

        function set object(k:IRoomObject):void;
        function get object():IRoomObject;
        function dispose():void;
        function initialize(k:IRoomObjectVisualizationData):Boolean;
        function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;
        function get image():BitmapData;
        function getImage(k:int, _arg_2:int):BitmapData;
        function get boundingRectangle():Rectangle;
        function getInstanceId():int;
        function getUpdateID():int;

    }
}//package com.sulake.room.object.visualization

