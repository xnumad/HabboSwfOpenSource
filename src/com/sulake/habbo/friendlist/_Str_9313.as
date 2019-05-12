package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class _Str_9313 
    {
        private var _habboFriendList:HabboFriendList;
        private var _Str_3245:IWindowContainer;
        private var _Str_2364:Timer;

        public function _Str_9313(k:HabboFriendList)
        {
            this._habboFriendList = k;
        }

        public function show(k:int, _arg_2:int):void
        {
            if (this._Str_3245 != null)
            {
                this.close(null);
            }
            this._Str_3245 = this._Str_23551();
            if (this._Str_2364 != null)
            {
                this._Str_2364.stop();
            }
            this._Str_2364 = new Timer(2000, 1);
            this._Str_2364.addEventListener(TimerEvent.TIMER, this.close);
            this._Str_2364.start();
            this._Str_3245.x = k;
            this._Str_3245.y = _arg_2;
        }

        private function close(k:Event):void
        {
            this._Str_3245.destroy();
            this._Str_3245 = null;
        }

        private function _Str_23551():IWindowContainer
        {
            var k:IWindowContainer = IWindowContainer(this._habboFriendList.getXmlWindow("opened_to_web_popup"));
            this._habboFriendList.refreshButton(k, "opened_to_web", true, null, 0);
            return k;
        }
    }
}
