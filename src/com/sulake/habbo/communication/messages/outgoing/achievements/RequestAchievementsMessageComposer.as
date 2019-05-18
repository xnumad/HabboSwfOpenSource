package com.sulake.habbo.communication.messages.outgoing.achievements
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RequestAchievementsMessageComposer implements IMessageComposer 
    {
        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            return k;
        }
    }
}
