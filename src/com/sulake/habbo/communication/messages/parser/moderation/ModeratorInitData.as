package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ModeratorInitData implements IDisposable
    {
        private var _messageTemplates:Array;
        private var _roomMessageTemplates:Array;
        private var _issues:Array;
        private var _cfhPermission:Boolean;
        private var _chatlogsPermission:Boolean;
        private var _alertPermission:Boolean;
        private var _kickPermission:Boolean;
        private var _banPermission:Boolean;
        private var _roomAlertPermission:Boolean;
        private var _roomKickPermission:Boolean;
        private var _disposed:Boolean;

        public function ModeratorInitData(k:IMessageDataWrapper)
        {
            var _local_2:IssueInfoMessageParser = new IssueInfoMessageParser();
            this._issues = [];
            this._messageTemplates = [];
            this._roomMessageTemplates = [];
            var _local_3:int = k.readInteger();
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                if (_local_2.parse(k))
                {
                    this._issues.push(_local_2._Str_22192);
                }
                _local_4++;
            }
            _local_3 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                this._messageTemplates.push(k.readString());
                _local_4++;
            }
            _local_3 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                k.readString();
                _local_4++;
            }
            this._cfhPermission = k.readBoolean();
            this._chatlogsPermission = k.readBoolean();
            this._alertPermission = k.readBoolean();
            this._kickPermission = k.readBoolean();
            this._banPermission = k.readBoolean();
            this._roomAlertPermission = k.readBoolean();
            this._roomKickPermission = k.readBoolean();
            _local_3 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                this._roomMessageTemplates.push(k.readString());
                _local_4++;
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._messageTemplates = null;
            this._roomMessageTemplates = null;
            this._issues = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_15690():Array
        {
            return this._messageTemplates;
        }

        public function get _Str_18336():Array
        {
            return this._roomMessageTemplates;
        }

        public function get issues():Array
        {
            return this._issues;
        }

        public function get _Str_24070():Boolean
        {
            return this._cfhPermission;
        }

        public function get _Str_12765():Boolean
        {
            return this._chatlogsPermission;
        }

        public function get _Str_18465():Boolean
        {
            return this._alertPermission;
        }

        public function get _Str_20397():Boolean
        {
            return this._kickPermission;
        }

        public function get _Str_21242():Boolean
        {
            return this._banPermission;
        }

        public function get _Str_24851():Boolean
        {
            return this._roomAlertPermission;
        }

        public function get _Str_24333():Boolean
        {
            return this._roomKickPermission;
        }
    }
}
