package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView;
    import com.sulake.habbo.ui.widget.contextmenu.IContextMenuParentWidget;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_3382;
    import com.sulake.core.window.events.WindowEvent;

    public class FriendFurniContextMenuView extends FurnitureContextInfoView 
    {
        public function FriendFurniContextMenuView(k:IContextMenuParentWidget)
        {
            super(k);
        }

        override protected function updateWindow():void
        {
            var k:XML;
            var _local_2:IWindow;
            if ((((_Str_2268 == null) || (_Str_2268.assets == null)) || (_Str_2268.windowManager == null)))
            {
                return;
            }
            if (_Str_3452)
            {
                activeView = _Str_3113();
            }
            else
            {
                if (((window == null) || (window.disposed)))
                {
                    k = (_Str_2268.assets.getAssetByName("friendfurni_menu").content as XML);
                    _window = (_Str_2268.windowManager.buildFromXML(k, 0) as IWindowContainer);
                    if (window == null)
                    {
                        return;
                    }
                    window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                    window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                    _local_2 = window.findChildByName("minimize");
                    if (_local_2 != null)
                    {
                        _local_2.addEventListener(WindowMouseEvent.CLICK, _Str_4457);
                        _local_2.addEventListener(WindowMouseEvent.OVER, _Str_3052);
                        _local_2.addEventListener(WindowMouseEvent.OUT, _Str_3052);
                    }
                }
                _window.findChildByName("buttons").procedure = this.buttonEventProc;
                _window.visible = false;
                activeView = window;
                _Str_3196 = false;
            }
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:FurnitureContextMenuWidget;
            if ((((disposed) || (window == null)) || (window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    switch (_arg_2.parent.name)
                    {
                        case "use":
                            _local_4 = (_Str_2268 as FurnitureContextMenuWidget);
                            if (_local_4 != null)
                            {
                                _local_4.handler.container.connection.send(new _Str_3382(_Str_2731.getId()));
                            }
                            break;
                    }
                }
                _local_3 = true;
            }
            else
            {
                super.buttonEventProc(k, _arg_2);
            }
            if (_local_3)
            {
                _Str_2268.removeView(this, false);
            }
        }
    }
}
