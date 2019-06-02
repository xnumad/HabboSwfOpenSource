//com.sulake.habbo.room.IGetImageListener

package com.sulake.habbo.room{
    import flash.display.BitmapData;

    public /*dynamic*/ interface IGetImageListener {

        function imageReady(k:int, _arg_2:BitmapData):void;
        function imageFailed(k:int):void;

    }
}//package com.sulake.habbo.room

