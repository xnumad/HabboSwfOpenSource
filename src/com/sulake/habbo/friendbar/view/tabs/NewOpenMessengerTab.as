package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class NewOpenMessengerTab extends Tab 
    {
        protected static const ICON:String = "icon";
        protected static const HEADER:String = "header";
        private static const NEW_OPEN_MESSENGER_TAB_XML:String = "new_open_messenger_tab_xml";
        private static const DEFAULT_COLOR:uint = 8374494;
        private static const _Str_2841:uint = 9560569;
        private static const _Str_20489:int = 10;
        private static const POOL:Array = [];
        private static const _Str_4440:Array = [];


        public static function _Str_2363():NewOpenMessengerTab
        {
            var k:NewOpenMessengerTab;
            k = ((POOL.length > 0) ? POOL.pop() : new (NewOpenMessengerTab)());
            k._Str_2638 = false;
            k._window = k._Str_18310();
            return k;
        }


        public function _Str_18310():IWindowContainer
        {
            var k:IWindowContainer = ((_Str_4440.length > 0) ? _Str_4440.pop() : (_Str_3684.buildFromXML((_Str_2787.getAssetByName(NEW_OPEN_MESSENGER_TAB_XML).content as XML)) as IWindowContainer));
            k.addEventListener(WindowMouseEvent.CLICK, this._Str_3369);
            k.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            k.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            k.height = HEIGHT;
            return k;
        }

        private function _Str_18874(k:IWindowContainer):void
        {
            if (((k) && (!(k.disposed))))
            {
                k.procedure = null;
                k.removeEventListener(WindowMouseEvent.CLICK, onMouseClick);
                k.removeEventListener(WindowMouseEvent.OVER, onMouseOver);
                k.removeEventListener(WindowMouseEvent.OUT, onMouseOut);
                k.width = WIDTH;
                k.height = HEIGHT;
                if (_Str_4440.indexOf(k) == -1)
                {
                    _Str_4440.push(k);
                }
            }
        }

        override public function recycle():void
        {
            if (!disposed)
            {
                if (!_Str_2638)
                {
                    if (_window)
                    {
                        this._Str_18874(_window);
                        _window = null;
                    }
                    _Str_2638 = true;
                    POOL.push(this);
                }
            }
        }

        override protected function expose():void
        {
            super.expose();
            _window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
        }

        override protected function conceal():void
        {
            super.conceal();
            _window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
        }

        private function _Str_3369(k:WindowMouseEvent):void
        {
            if (((!(disposed)) && (!(_Str_6044))))
            {
                _Str_2925.toggleMessenger();
            }
        }
    }
}

