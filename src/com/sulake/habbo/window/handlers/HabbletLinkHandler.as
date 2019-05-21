package com.sulake.habbo.window.handlers
{
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habboclient._Str_5079;

    public class HabbletLinkHandler implements ILinkEventTracker, IDisposable 
    {
        private var _windowManager:HabboWindowManagerComponent;

        public function HabbletLinkHandler(k:HabboWindowManagerComponent)
        {
            this._windowManager = k;
        }

        public function get eventUrlPrefix():String
        {
            return "habblet/";
        }

        public function linkReceived(k:String):void
        {
            var _local_3:String;
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "open":
                    if (_local_2.length > 2)
                    {
                        _local_3 = _local_2[2];
                        if (_local_3 == "credits")
                        {
                            HabboWebTools.openWebPageAndMinimizeClient(this._windowManager.getProperty(_Str_5079.WEB_SHOP_RELATIVEURL));
                        }
                        else
                        {
                            HabboWebTools.openHabblet(_local_3);
                        }
                    }
                    return;
            }
        }

        public function dispose():void
        {
            this._windowManager = null;
        }

        public function get disposed():Boolean
        {
            return this._windowManager == null;
        }
    }
}
