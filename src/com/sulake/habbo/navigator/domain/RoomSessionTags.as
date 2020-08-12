package com.sulake.habbo.navigator.domain
{
    import com.sulake.habbo.communication.messages.outgoing.navigator.SetRoomSessionTagsMessageComposer;

    public class RoomSessionTags 
    {
        private var _tag1:String;
        private var _tag2:String;

        public function RoomSessionTags(k:String, _arg_2:String)
        {
            this._tag1 = k;
            this._tag2 = _arg_2;
        }

        public function _Str_23991():SetRoomSessionTagsMessageComposer
        {
            return new SetRoomSessionTagsMessageComposer(this._tag1, this._tag2);
        }
    }
}
