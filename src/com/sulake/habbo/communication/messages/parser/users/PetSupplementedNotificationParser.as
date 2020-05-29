﻿package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetSupplementedNotificationParser implements IMessageParser
    {
        private var _petId:int;
        private var _userId:int;
        private var _Str_19754:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._petId = k.readInteger();
            this._userId = k.readInteger();
            this._Str_19754 = k.readInteger();
            return true;
        }

        public function get _Str_2508():int
        {
            return this._petId;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_25578():int
        {
            return this._Str_19754;
        }
    }
}
