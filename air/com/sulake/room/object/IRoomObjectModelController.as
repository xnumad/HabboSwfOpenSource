//com.sulake.room.object.IRoomObjectModelController

package com.sulake.room.object{
    import com.sulake.core.utils.Map;

    public /*dynamic*/ interface IRoomObjectModelController extends IRoomObjectModel {

        function setNumber(k:String, _arg_2:Number, _arg_3:Boolean=false):void;
        function setString(k:String, _arg_2:String, _arg_3:Boolean=false):void;
        function setNumberArray(k:String, _arg_2:Array, _arg_3:Boolean=false):void;
        function setStringArray(k:String, _arg_2:Array, _arg_3:Boolean=false):void;
        function setStringToStringMap(k:String, _arg_2:Map, _arg_3:Boolean=false):void;

    }
}//package com.sulake.room.object

