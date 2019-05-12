package com.sulake.habbo.freeflowchat.data
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.session.events.RoomSessionEvent;

    public class RoomSessionEventHandler implements IDisposable 
    {
        private var _component:HabboFreeFlowChat;

        public function RoomSessionEventHandler(k:HabboFreeFlowChat)
        {
            this._component = k;
            this._component.roomSessionManager.events.addEventListener(RoomSessionEvent.CREATED, this._Str_19700);
            this._component.roomSessionManager.events.addEventListener(RoomSessionEvent.ENDED, this._Str_21581);
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._component)
                {
                    this._component.roomSessionManager.events.removeEventListener(RoomSessionEvent.CREATED, this._Str_19700);
                    this._component.roomSessionManager.events.removeEventListener(RoomSessionEvent.ENDED, this._Str_21581);
                    this._component = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }

        private function _Str_19700(k:RoomSessionEvent):void
        {
            this._component._Str_15723();
        }

        private function _Str_21581(k:RoomSessionEvent):void
        {
            this._component._Str_13202();
        }
    }
}
