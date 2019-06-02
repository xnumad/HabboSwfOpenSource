package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.window.IWindowContainer;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.help.enum.WelcomeNotificationAlignment;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;

    public class WelcomeScreenController implements IUpdateReceiver 
    {
        private var _habboHelp:HabboHelp;
        private var _disposed:Boolean;
        private var _window:IWindowContainer;
        private var _targetLoc:Point;
        private var _targetIconId:String;
        private var _alignment:int;
        private var _clickActionId:String;

        public function WelcomeScreenController(k:HabboHelp)
        {
            this._targetLoc = new Point(72, 10);
            super();
            this._habboHelp = k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._habboHelp)
            {
                this._habboHelp.removeUpdateReceiver(this);
                this._habboHelp = null;
            }
            if (this._window)
            {
                this._window.findChildByName("close").removeEventListener(WindowMouseEvent.CLICK, this._Str_20454);
                this._window.findChildByName("click").removeEventListener(WindowMouseEvent.CLICK, this._Str_21239);
                this._window.dispose();
                this._window = null;
            }
            this._disposed = true;
        }

        public function _Str_8205(k:String, _arg_2:String, _arg_3:int, _arg_4:String):void
        {
            if (this._disposed)
            {
                return;
            }
            this._targetIconId = k;
            this._alignment = _arg_3;
            this._clickActionId = _arg_4;
            if (this._window == null)
            {
                this._Str_10233();
            }
            var _local_5:ITextWindow = ITextWindow(this._window.findChildByName("text"));
            _local_5.caption = (("${" + _arg_2) + "}");
            _local_5.height = (_local_5.textHeight + 5);
            this._Str_3714();
            this._Str_25505();
            this._window.visible = true;
            this._window.activate();
        }

        private function _Str_10233():void
        {
            var k:XmlAsset = (this._habboHelp.assets.getAssetByName("welcome_screen_xml") as XmlAsset);
            this._window = (this._habboHelp.windowManager.buildFromXML((k.content as XML), 2) as IWindowContainer);
            var _local_2:IFrameWindow = (this._window.findChildByName("frame") as IFrameWindow);
            _local_2.header.visible = false;
            _local_2.content.y = (_local_2.content.y - 20);
            var _local_3:ITextWindow = (this._window.findChildByName("text") as ITextWindow);
            _local_3.height = (_local_3.textHeight + 5);
            _local_2.content.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH, false);
            _local_2.height = (_local_2.height - 20);
            this._window.findChildByName("close").addEventListener(WindowMouseEvent.CLICK, this._Str_20454);
            this._window.findChildByName("click").addEventListener(WindowMouseEvent.CLICK, this._Str_21239);
        }

        private function _Str_3714():void
        {
            var k:Rectangle = this._habboHelp.toolbar.getIconLocation(this._targetIconId);
            var _local_2:IWindow = this._window.findChildByName("arrow");
            var _local_3:IWindow = this._window.findChildByName("arrow_right");
            if (k == null)
            {
                k = new Rectangle(0, 0, this._window.width, this._window.height);
            }
            if (this._alignment == WelcomeNotificationAlignment.LEFT)
            {
                this._targetLoc.x = 72;
                this._window.x = -(this._window.width);
                _local_2.y = ((this._window.height - _local_2.height) / 2);
                _local_2.visible = true;
                _local_3.visible = false;
            }
            else
            {
                this._targetLoc.x = (k.x - this._window.width);
                this._window.x = ((k.x + k.width) + this._window.width);
                _local_3.y = ((this._window.height - _local_2.height) / 2);
                _local_3.visible = true;
                _local_2.visible = false;
            }
            if (k != null)
            {
                this._targetLoc.y = ((k.y + (k.height / 2)) - (this._window.height / 2));
            }
            else
            {
                this._targetLoc.y = 0;
            }
            this._window.y = this._targetLoc.y;
        }

        private function _Str_20454(k:WindowMouseEvent):void
        {
            this.closeWindow();
        }

        private function _Str_21239(k:WindowMouseEvent):void
        {
            if (this._clickActionId != null)
            {
                this._habboHelp.toolbar.toggleWindowVisibility(this._clickActionId);
            }
            this.closeWindow();
        }

        private function closeWindow():void
        {
            if (!this._window)
            {
                return;
            }
            this._window.visible = false;
            this.dispose();
        }

        public function update(k:uint):void
        {
            var _local_3:Point;
            if (this._window == null)
            {
                this._habboHelp.removeUpdateReceiver(this);
                return;
            }
            var _local_2:Number = Point.distance(this._window.position, this._targetLoc);
            if (_local_2 > 5)
            {
                _local_3 = Point.interpolate(this._window.position, this._targetLoc, 0.5);
                this._window.x = _local_3.x;
                this._window.y = _local_3.y;
            }
            else
            {
                this._window.x = this._targetLoc.x;
                this._window.y = this._targetLoc.y;
                this._habboHelp.removeUpdateReceiver(this);
            }
        }

        private function _Str_25505():void
        {
            this._habboHelp.removeUpdateReceiver(this);
            this._habboHelp.registerUpdateReceiver(this, 10);
        }

        public function _Str_3304(k:HabboToolbarEvent):void
        {
            var _local_2:Rectangle;
            if (this._disposed)
            {
                return;
            }
            switch (k.type)
            {
                case HabboToolbarEvent.HTE_RESIZED:
                    if (this._habboHelp != null)
                    {
                        _local_2 = this._habboHelp.toolbar.getIconLocation(this._targetIconId);
                    }
                    if (_local_2 != null)
                    {
                        this._targetLoc.y = ((_local_2.y + (_local_2.height / 2)) - (this._window.height / 2));
                        this._window.y = this._targetLoc.y;
                    }
                    return;
                case HabboToolbarEvent.HTE_TOOLBAR_CLICK:
                case HabboToolbarEvent.HTE_GROUP_ROOM_INFO_CLICK:
                    this.closeWindow();
                    return;
            }
        }
    }
}
