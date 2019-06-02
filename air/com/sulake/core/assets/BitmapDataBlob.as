//com.sulake.core.assets.BitmapDataBlob

package com.sulake.core.assets{
    import flash.utils.IExternalizable;
    import flash.utils.ByteArray;
    import flash.display.BitmapData;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;

    public class BitmapDataBlob implements IExternalizable {

        private var _width:int;
        private var _height:int;
        private var _transparent:Boolean;
        private var _bytes:ByteArray;
        private var _compress:Boolean;

        public function BitmapDataBlob();

        public static function make(k:BitmapData, _arg_2:Boolean=true):BitmapDataBlob;


        public function dispose():void;

        public function set data(k:BitmapData):void;

        public function get data():BitmapData;

        public function set compress(k:Boolean):void;

        public function writeExternal(k:IDataOutput):void;

        public function readExternal(k:IDataInput):void;


    }
}//package com.sulake.core.assets

