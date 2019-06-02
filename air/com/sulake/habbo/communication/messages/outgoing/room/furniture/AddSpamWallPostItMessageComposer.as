//com.sulake.habbo.communication.messages.outgoing.room.furniture.AddSpamWallPostItMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AddSpamWallPostItMessageComposer implements IMessageComposer {

        private var _itemId:int;
        private var _location:String;
        private var _message:String;
        private var _colorHex:String;

        public function AddSpamWallPostItMessageComposer(k:int, _arg_2:String, _arg_3:String, _arg_4:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

