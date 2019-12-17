package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.core.communication.connection.IConnection;
	import com.sulake.habbo.session.IRoomSession;
	import com.sulake.habbo.session.IRoomHandlerListener;
	import com.sulake.habbo.session.events.RoomSessionPollEvent;
	import com.sulake.habbo.session.handler.BaseHandler;
	/**
	 * ...
	 * @author 
	 */
	public class RoomPollHandler extends BaseHandler 
	{
		
		public function RoomPollHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (!_arg_1)
            {
                return;
            }
            _arg_1.addMessageEvent(new StartRoomPollEvent(this._SafeStr_4168));
            _arg_1.addMessageEvent(new RoomPollResultEvent(this._SafeStr_4169));
        }

        private function _SafeStr_4168(_arg_1:StartRoomPollEvent):void
        {
            var _local_4:RoomSessionPollEvent;
            if (!_arg_1)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
			
            var _local_3:RoomPollDataParser = _arg_1.getParser();
            _local_4 = new RoomSessionPollEvent(RoomSessionPollEvent.VOTE_QUESTION, _local_2, _local_3.question, _local_3.choices);
            listener.events.dispatchEvent(_local_4);
			Habbo.trackLoginStep("TEST ROOM POLL HANDLER 1");
        }

        private function _SafeStr_4169(_arg_1:RoomPollResultEvent):void
        {
            var _local_4:RoomSessionPollEvent;
            if (!_arg_1)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:RoomPollResultParser = _arg_1.getParser();
            _local_4 = new RoomSessionPollEvent(RoomSessionPollEvent.VOTE_RESULT, _local_2, _local_3.question, _local_3.choices, _local_3._SafeStr_4173, _local_3._SafeStr_4174);
            listener.events.dispatchEvent(_local_4);
			Habbo.trackLoginStep("TEST ROOM POLL HANDLER 2");
        }
		
	}

}
