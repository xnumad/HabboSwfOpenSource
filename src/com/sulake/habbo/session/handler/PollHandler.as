package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.poll._Str_8693;
    import com.sulake.habbo.communication.messages.incoming.poll._Str_8499;
    import com.sulake.habbo.communication.messages.incoming.poll._Str_8563;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.events._Str_3051;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.poll._Str_7882;
    import com.sulake.habbo.communication.messages.parser.poll._Str_7270;
    import com.sulake.habbo.communication.messages.parser.poll._Str_7203;

    public class PollHandler extends BaseHandler 
    {
        public function PollHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (!k)
            {
                return;
            }
            k.addMessageEvent(new _Str_8693(this._Str_25602));
            k.addMessageEvent(new _Str_8499(this._Str_23305));
            k.addMessageEvent(new _Str_8563(this._Str_22261));
        }

        private function _Str_23305(k:_Str_8499):void
        {
            var _local_4:_Str_3051;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_7882 = k.getParser();
            _local_4 = new _Str_3051(_Str_3051.RSPE_POLL_OFFER, _local_2, _local_3.id);
            _local_4.summary = _local_3.headline;
            _local_4.summary = _local_3.summary;
            listener.events.dispatchEvent(_local_4);
        }

        private function _Str_22261(k:_Str_8563):void
        {
            var _local_4:_Str_3051;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_7270 = k.getParser();
            _local_4 = new _Str_3051(_Str_3051.ERROR, _local_2, -1);
            _local_4.headline = "???";
            _local_4.summary = "???";
            listener.events.dispatchEvent(_local_4);
        }

        private function _Str_25602(k:_Str_8693):void
        {
            var _local_4:_Str_3051;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_7203 = k.getParser();
            _local_4 = new _Str_3051(_Str_3051.RSPE_POLL_CONTENT, _local_2, _local_3.id);
            _local_4._Str_6013 = _local_3._Str_6013;
            _local_4._Str_5838 = _local_3._Str_5838;
            _local_4._Str_6760 = _local_3._Str_6760;
            _local_4._Str_5643 = _local_3._Str_5643;
            _local_4._Str_6196 = _local_3._Str_6196;
            listener.events.dispatchEvent(_local_4);
        }
    }
}
