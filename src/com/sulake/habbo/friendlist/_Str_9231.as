package com.sulake.habbo.friendlist
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IBorderWindow;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class _Str_9231 implements IDisposable 
    {
        private var _habboFriendList:HabboFriendList;
        private var _window:IBorderWindow;
        private var _Str_5045:int;
        private var _disposed:Boolean = false;

        public function _Str_9231(k:HabboFriendList)
        {
            this._habboFriendList = k;
            this.createWindow();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._Str_2669();
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_24722(k:IWindow, _arg_2:IWindow):void
        {
            var _local_3:Point = new Point();
            k.getGlobalPosition(_local_3);
            this._window.x = _local_3.x;
            this._window.y = _local_3.y;
            this._window.visible = true;
            this._window.activate();
        }

        public function _Str_17733():void
        {
            this._window.visible = false;
        }

        public function set _Str_9566(k:int):void
        {
            this._Str_5045 = k;
        }

        private function createWindow():void
        {
            this._window = IBorderWindow(this._habboFriendList.windowManager.buildFromXML(XML(this._habboFriendList.assets.getAssetByName("relationship_chooser_xml").content)));
            this._window.procedure = this._Str_3061;
            this._window.visible = false;
        }

        private function _Str_2669():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_3061(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "item_none":
                        this._habboFriendList.setRelationshipStatus(this._Str_5045, RelationshipStatusEnum.NONE);
                        break;
                    case "item_heart":
                        this._habboFriendList.setRelationshipStatus(this._Str_5045, RelationshipStatusEnum._Str_9205);
                        break;
                    case "item_smile":
                        this._habboFriendList.setRelationshipStatus(this._Str_5045, RelationshipStatusEnum._Str_8388);
                        break;
                    case "item_bobba":
                        this._habboFriendList.setRelationshipStatus(this._Str_5045, RelationshipStatusEnum._Str_8824);
                        break;
                }
                this._window.visible = false;
            }
            if (k.type == WindowEvent.WINDOW_EVENT_UNFOCUSED)
            {
                this._window.visible = false;
            }
        }
    }
}
