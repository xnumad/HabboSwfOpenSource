package com.sulake.habbo.navigator.inroom
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3579;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;

    public class RoomEventInfoCtrl implements IDisposable 
    {
        private static const ROOM_EVENT_INFO:String = "room_event_info";

        private var _navigator:IHabboTransitionalNavigator;
        private var _window:IWindowContainer;
        private var _expanded:Boolean = true;

        public function RoomEventInfoCtrl(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
        }

        private function get enabled():Boolean
        {
            var k:Boolean = ((this._navigator.getInteger("new.identity", 0) == 0) || (!(this._navigator.getBoolean("new.identity.hide.ui"))));
            return (this._navigator.getBoolean("eventinfo.enabled")) && (k);
        }

        public function dispose():void
        {
            if (this._navigator)
            {
                this._navigator.toolbar.extensionView.detachExtension(ROOM_EVENT_INFO);
            }
            this._navigator = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._navigator == null;
        }

        public function refresh():void
        {
            if ((((this._navigator.toolbar == null) || (this._navigator.toolbar.extensionView == null)) || (!(this.enabled))))
            {
                return;
            }
            var k:* = (!(this._navigator.data._Str_4112 == null));
            var _local_2:Boolean = ((this._navigator.data._Str_12763) || (this._navigator.data._Str_15161));
            var _local_3:int = this._navigator.data._Str_20386;
            var _local_4:IRoomSession = this._navigator.roomSessionManager.getSession(_local_3);
            if (!_local_4)
            {
                return;
            }
            if (_local_4.roomControllerLevel == RoomControllerLevel.GUEST)
            {
                _local_2 = true;
            }
            var _local_5:Boolean = this._navigator.data._Str_12763;
            if ((((!(k)) && (!(_local_5))) && (!(_local_2))))
            {
                this._navigator.toolbar.extensionView.detachExtension(ROOM_EVENT_INFO);
                return;
            }
            this._Str_2755();
            var _local_6:Boolean = (((this._expanded) && (k)) && (_local_5));
            this._window.findChildByName("event_bg_owner").visible = _local_6;
            var _local_7:Boolean = (((this._expanded) && (k)) && (!(_local_5)));
            this._window.findChildByName("event_bg_visitor").visible = _local_7;
            var _local_8:Boolean = ((!(this._expanded)) || (!(k)));
            this._window.findChildByName("event_bg_contracted").visible = _local_8;
            var _local_9:Boolean = (((this._expanded) && (k)) && (_local_2));
            this._window.findChildByName("modify_link_region").visible = _local_9;
            this._window.findChildByName("extend_event_region").visible = ((_local_9) && (this._Str_23285()));
            var _local_10:Boolean = ((!(k)) && (_local_2));
            this._window.findChildByName("get_event").visible = _local_10;
            this._window.findChildByName("create_link").visible = false;
            var _local_11:Boolean = (((this._expanded) && (k)) && (!(_local_2)));
            this._window.findChildByName("in_progress_txt").visible = _local_11;
            var _local_12:Boolean = ((this._expanded) && (k));
            this._window.findChildByName("desc_txt").visible = _local_12;
            this._window.findChildByName("header_txt").visible = k;
            this._window.visible = (((k) && ((((((_local_6) || (_local_7)) || (_local_8)) || (_local_9)) || (_local_11)) || (_local_12))) || (_local_10));
            if (k)
            {
                this._window.findChildByName("header_txt").caption = this._navigator.data._Str_4112.eventName;
                this._window.findChildByName("desc_txt").caption = this._navigator.data._Str_4112.eventDescription;
            }
            this._navigator.toolbar.extensionView.attachExtension(ROOM_EVENT_INFO, this._window, -1, ["next_quest_timer", "quest_tracker"]);
            this._window.x = 0;
            this._window.y = 0;
            this._window.height = (((this._expanded) && (k)) ? this._window.findChildByName("event_bg_visitor").height : this._window.findChildByName("event_bg_contracted").height);
        }

        private function _Str_23285():Boolean
        {
            var k:_Str_3579 = this._navigator.data._Str_4112;
            if (k == null)
            {
                return false;
            }
            if (!this._navigator.getBoolean("roomad.limit_total_time"))
            {
                return true;
            }
            var _local_2:Date = new Date();
            var _local_3:Number = _local_2.getTime();
            var _local_4:Date = k._Str_21519;
            var _local_5:int = this._navigator.getInteger("room_ad.duration.minutes", 120);
            var _local_6:int = this._navigator.getInteger("room_ad.maximum_total_time.minutes", 10080);
            return (_local_4.getTime() + ((_local_5 * 60) * 1000)) < (_local_3 + ((_local_6 * 60) * 1000));
        }

        private function _Str_17806(k:WindowEvent):void
        {
            if (this._navigator.data._Str_4112 != null)
            {
                this._expanded = (!(this._expanded));
                this.refresh();
            }
            else
            {
                this._navigator._Str_12506();
            }
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_event_info"));
            this._window.findChildByName("modify_link_region").procedure = this._Str_24529;
            this._window.findChildByName("extend_event_region").procedure = this._Str_25123;
            this._window.findChildByName("bg_region").addEventListener(WindowMouseEvent.CLICK, this._Str_17806);
        }

        public function close():void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this._window.visible = false;
                this._navigator.toolbar.extensionView.detachExtension(ROOM_EVENT_INFO);
            }
        }

        private function _Str_24529(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._navigator._Str_6939.show();
            }
        }

        private function _Str_25123(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:_Str_3579;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._navigator.data._Str_4112;
                this._navigator._Str_14281(_local_3.eventName, _local_3.eventDescription, _local_3._Str_21519, _local_3._Str_2712);
            }
        }

        public function set expanded(k:Boolean):void
        {
            this._expanded = k;
        }
    }
}
