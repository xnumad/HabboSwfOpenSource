package com.sulake.habbo.friendlist
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;
    import com.sulake.core.window.components.IFrameWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class AlertView implements IDisposable 
    {
        private static var _Str_4602:Dictionary = new Dictionary();

        private var _habboFriendList:HabboFriendList;
        private var _Str_3245:IFrameWindow;
        private var _Str_4188:String;
        private var _Str_2495:String;
        private var _disposed:Boolean;

        public function AlertView(k:HabboFriendList, _arg_2:String, _arg_3:String=null)
        {
            this._habboFriendList = k;
            this._Str_4188 = _arg_2;
            this._Str_2495 = _arg_3;
        }

        public function show():void
        {
            var k:IFrameWindow = IFrameWindow(_Str_4602[this._Str_4188]);
            if (k != null)
            {
                k.dispose();
            }
            this._Str_3245 = this._Str_23510();
            if (this._Str_2495 != null)
            {
                this._Str_3245.caption = this._Str_2495;
            }
            this.setupContent(this._Str_3245.content);
            var _local_2:Rectangle = Util._Str_10228(this._habboFriendList.view.mainWindow, this._Str_3245.width, this._Str_3245.height);
            this._Str_3245.x = _local_2.x;
            this._Str_3245.y = _local_2.y;
            _Str_4602[this._Str_4188] = this._Str_3245;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._Str_3245 != null)
            {
                this._Str_3245.destroy();
                this._Str_3245 = null;
            }
            this._habboFriendList = null;
        }

        internal function setupContent(k:IWindowContainer):void
        {
        }

        internal function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.dispose();
        }

        private function _Str_23510():IFrameWindow
        {
            var k:IFrameWindow = IFrameWindow(this._habboFriendList.getXmlWindow(this._Str_4188));
            var _local_2:IWindow = k.findChildByTag("close");
            _local_2.procedure = this._Str_2392;
            return k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get friendList():HabboFriendList
        {
            return this._habboFriendList;
        }
    }
}
