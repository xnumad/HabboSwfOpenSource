//com.sulake.core.assets.loaders.TextFileLoader

package com.sulake.core.assets.loaders{
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.events.Event;

    public class TextFileLoader extends BinaryFileLoader implements IAssetLoader {

        public function TextFileLoader(k:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:int=-1, _arg_5:ByteArray=null, _arg_6:int=-1);

        override protected function retry():Boolean;

        override protected function loadEventHandler(k:Event):void;

        private function unCompress():void;


    }
}//package com.sulake.core.assets.loaders

