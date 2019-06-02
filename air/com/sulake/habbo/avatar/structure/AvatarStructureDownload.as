//com.sulake.habbo.avatar.structure.AvatarStructureDownload

package com.sulake.habbo.avatar.structure{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.Event;

    public class AvatarStructureDownload extends EventDispatcherWrapper {

        public static const STRUCTURE_DONE:String;

        private var _dataReceiver:IStructureData;

        public function AvatarStructureDownload(k:IAssetLibrary, _arg_2:String, _arg_3:IStructureData);

        private function onDataComplete(k:Event):void;

        private function onDataFailed(k:Event):void;


    }
}//package com.sulake.habbo.avatar.structure

