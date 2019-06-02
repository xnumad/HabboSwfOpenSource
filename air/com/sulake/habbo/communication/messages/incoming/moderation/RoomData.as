//com.sulake.habbo.communication.messages.incoming.moderation.RoomData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomData implements IDisposable {

        private var _exists:Boolean;
        private var _name:String;
        private var _desc:String;
        private var _tags:Array;
        private var _disposed:Boolean;

        public function RoomData(k:IMessageDataWrapper);

        public function get disposed():Boolean;

        public function dispose():void;

        public function get name():String;

        public function get desc():String;

        public function get tags():Array;

        public function get exists():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

