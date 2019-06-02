//com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomThumbnailData implements IDisposable {

        private var _bgImgId:int;
        private var _frontImgId:int;
        private var _objects:Array;
        private var _disposed:Boolean;

        public function RoomThumbnailData(k:IMessageDataWrapper);

        private function setDefaults():void;

        public function getCopy():RoomThumbnailData;

        public function dispose():void;

        public function getAsString():String;

        public function get disposed():Boolean;

        public function get bgImgId():int;

        public function get frontImgId():int;

        public function get objects():Array;

        public function set bgImgId(k:int):void;

        public function set frontImgId(k:int):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

