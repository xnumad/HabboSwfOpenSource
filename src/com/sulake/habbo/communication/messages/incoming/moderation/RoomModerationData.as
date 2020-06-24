package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomModerationData implements IDisposable
    {
        private var _flatId:int;
        private var _userCount:int;
        private var _ownerInRoom:Boolean;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _room:RoomData;
        private var _disposed:Boolean;

        public function RoomModerationData(k:IMessageDataWrapper)
        {
            this._flatId = k.readInteger();
            this._userCount = k.readInteger();
            this._ownerInRoom = k.readBoolean();
            this._ownerId = k.readInteger();
            this._ownerName = k.readString();
            this._room = new RoomData(k);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._room != null)
            {
                this._room.dispose();
                this._room = null;
            }
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get userCount():int
        {
            return this._userCount;
        }

        public function get ownerInRoom():Boolean
        {
            return this._ownerInRoom;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function get room():RoomData
        {
            return this._room;
        }
    }
}
