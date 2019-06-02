//com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectAvatarUpdateMessage extends RoomObjectMoveUpdateMessage {

        private var _dirHead:int;
        private var _canStandUp:Boolean;
        private var _baseY:Number;

        public function RoomObjectAvatarUpdateMessage(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:int, _arg_5:Boolean, _arg_6:Number);

        public function get dirHead():int;

        public function get canStandUp():Boolean;

        public function get baseY():Number;


    }
}//package com.sulake.habbo.room.messages

