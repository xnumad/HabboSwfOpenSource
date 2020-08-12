package com.sulake.habbo.communication.messages.outgoing.quest
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetConcurrentUsersGoalProgressMessageComposer implements IMessageComposer, IDisposable
    {


        public function get disposed():Boolean
        {
            return true;
        }

        public function getMessageArray():Array
        {
            return new Array();
        }

        public function dispose():void
        {
        }
    }
}
