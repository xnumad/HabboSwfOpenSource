package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8571 implements IMessageParser 
    {
        private var _songId:int;
        private var _officialSongId:String;


        public function flush():Boolean
        {
            this._songId = 0;
            this._officialSongId = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._officialSongId = k.readString();
            this._songId = k.readInteger();
            return true;
        }

        public function get _Str_3951():int
        {
            return this._songId;
        }

        public function get _Str_25744():String
        {
            return this._officialSongId;
        }
    }
}
