//com.sulake.habbo.session.handler.PollHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.communication.messages.incoming.poll.PollOfferEvent;
    import com.sulake.habbo.communication.messages.incoming.poll.PollErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.poll.PollContentsEvent;

    public class PollHandler extends BaseHandler {

        public function PollHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onPollOfferEvent(k:PollOfferEvent):void;

        private function onPollErrorEvent(k:PollErrorEvent):void;

        private function onPollContentsEvent(k:PollContentsEvent):void;


    }
}//package com.sulake.habbo.session.handler

