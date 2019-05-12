package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2807 
    {
        private var _groupId:int;
        private var _name:String;
        private var _description:String;
        private var _icon:String;
        private var _Str_6203:int;
        private var _Str_19654:int;
        private var _Str_5103:int;
        private var _Str_5870:int;
        private var _Str_6301:int;
        private var _Str_6813:int;
        private var _Str_6395:String;
        private var _Str_6378:int;


        public static function _Str_4933(k:IMessageDataWrapper):_Str_2807
        {
            return fillFromMessage(new (_Str_2807)(), k);
        }

        internal static function fillFromMessage(k:_Str_2807, _arg_2:IMessageDataWrapper):_Str_2807
        {
            k._groupId = _arg_2.readInteger();
            k._name = _arg_2.readString();
            k._description = _arg_2.readString();
            k._icon = _arg_2.readString();
            k._Str_6203 = _arg_2.readInteger();
            k._Str_19654 = _arg_2.readInteger();
            k._Str_5103 = _arg_2.readInteger();
            k._Str_5870 = _arg_2.readInteger();
            k._Str_6301 = _arg_2.readInteger();
            k._Str_6813 = _arg_2.readInteger();
            k._Str_6395 = _arg_2.readString();
            k._Str_6378 = _arg_2.readInteger();
            return k;
        }


        public function get groupId():int
        {
            return this._groupId;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get icon():String
        {
            return this._icon;
        }

        public function get _Str_18760():int
        {
            return this._Str_6203;
        }

        public function get _Str_25067():int
        {
            return this._Str_19654;
        }

        public function get _Str_8598():int
        {
            return this._Str_5103;
        }

        public function get _Str_18237():int
        {
            return this._Str_5870;
        }

        public function get _Str_10610():int
        {
            return this._Str_6301;
        }

        public function get _Str_8317():int
        {
            return this._Str_6813;
        }

        public function get _Str_9601():String
        {
            return this._Str_6395;
        }

        public function get _Str_8950():int
        {
            return this._Str_6378;
        }

        public function _Str_25309(k:_Str_2807):void
        {
            this._Str_6203 = k._Str_6203;
            this._Str_5103 = k._Str_5103;
            this._Str_5870 = k._Str_5870;
            this._Str_6813 = k._Str_6813;
            this._Str_6395 = k._Str_6395;
            this._Str_6301 = k._Str_6301;
            this._Str_6378 = k._Str_6378;
        }

        public function get _Str_12786():int
        {
            return this._Str_5103 - this._Str_5870;
        }

        public function set _Str_12786(k:int):void
        {
            this._Str_5870 = (this._Str_5103 - k);
            if (this._Str_5870 < 0)
            {
                this._Str_5870 = 0;
            }
        }

        public function _Str_23783(k:GuildForumThread):void
        {
            this._Str_6813 = k.lastUserId;
            this._Str_6395 = k.lastUserName;
            this._Str_6301 = k._Str_10610;
            this._Str_6378 = k.lastCommentTime;
            this._Str_6203++;
            this._Str_5103++;
            this._Str_5870 = 0;
        }
    }
}
