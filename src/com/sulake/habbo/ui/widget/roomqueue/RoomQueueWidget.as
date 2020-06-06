package com.sulake.habbo.ui.widget.roomqueue
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomQueueUpdateEvent;
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomQueueMessage;

    public class RoomQueueWidget extends RoomWidgetBase
    {
        private var _window:IFrameWindow;
        private var _config:IHabboConfigurationManager;
        private var _queuePosition:int;
        private var _hasClub:Boolean;
        private var _activeTarget:String;
        private var _isChangePossible:Boolean;
        private var _isClubQueue:Boolean;

        public function RoomQueueWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboConfigurationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._config = _arg_5;
        }

        override public function dispose():void
        {
            this.removeWindow();
            this._config = null;
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(RoomWidgetRoomQueueUpdateEvent.RWRQUE_VISITOR_QUEUE_STATUS, this.onQueueStatus);
            k.addEventListener(RoomWidgetRoomQueueUpdateEvent.RWRQUE_SPECTATOR_QUEUE_STATUS, this.onQueueStatus);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(RoomWidgetRoomQueueUpdateEvent.RWRQUE_VISITOR_QUEUE_STATUS, this.onQueueStatus);
            k.removeEventListener(RoomWidgetRoomQueueUpdateEvent.RWRQUE_SPECTATOR_QUEUE_STATUS, this.onQueueStatus);
        }

        private function removeWindow():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function onQueueStatus(k:RoomWidgetRoomQueueUpdateEvent):void
        {
            if (k == null)
            {
                return;
            }
            if (k.isActive)
            {
                this._activeTarget = k.type;
                this._isChangePossible = false;
                this._queuePosition = k.position;
            }
            else
            {
                this._isChangePossible = true;
            }
            this._hasClub = k.hasHabboClub;
            this._isClubQueue = k.isClubQueue;
            localizations.registerParameter("room.queue.position", "position", this._queuePosition.toString());
            localizations.registerParameter("room.queue.position.hc", "position", this._queuePosition.toString());
            localizations.registerParameter("room.queue.spectator.position", "position", this._queuePosition.toString());
            localizations.registerParameter("room.queue.spectator.position.hc", "position", this._queuePosition.toString());
            this.showInterface();
        }

        private function createWindow():Boolean
        {
            if (this._window != null)
            {
                return true;
            }
            var k:XmlAsset = (assets.getAssetByName("room_queue") as XmlAsset);
            this._window = (windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            if (this._window == null)
            {
                return false;
            }
            this._window.visible = false;
            var _local_2:IWindow = this._window.findChildByTag("close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.exitQueue);
            }
            _local_2 = this._window.findChildByName("cancel_button");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.exitQueue);
            }
            _local_2 = this._window.findChildByName("link_text");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.openLink);
            }
            _local_2 = this._window.findChildByName("change_button");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.changeQueue);
            }
            this._window.center();
            return true;
        }

        private function showInterface():void
        {
            if (!this.createWindow())
            {
                return;
            }
            var k:ITextWindow = (this._window.findChildByName("info_text") as ITextWindow);
            var _local_2:IButtonWindow = (this._window.findChildByName("change_button") as IButtonWindow);
            var _local_3:IWindow = this._window.findChildByName("spectator_info");
            if ((((!(k == null)) && (!(_local_2 == null))) && (!(_local_3 == null))))
            {
                switch (this._activeTarget)
                {
                    case RoomWidgetRoomQueueUpdateEvent.RWRQUE_VISITOR_QUEUE_STATUS:
                        k.caption = ((this._isClubQueue) ? "${room.queue.position.hc}" : "${room.queue.position}");
                        _local_2.caption = "${room.queue.spectatormode}";
                        _local_3.visible = this._isChangePossible;
                        break;
                    case RoomWidgetRoomQueueUpdateEvent.RWRQUE_SPECTATOR_QUEUE_STATUS:
                        k.caption = ((this._isClubQueue) ? "${room.queue.spectator.position.hc}" : "${room.queue.spectator.position}");
                        _local_2.caption = "${room.queue.back}";
                        _local_3.visible = false;
                        break;
                }
                _local_2.visible = this._isChangePossible;
            }
            var _local_4:IWindowContainer = (this._window.findChildByName("club_container") as IWindowContainer);
            if (_local_4 != null)
            {
                _local_4.visible = (!(this._hasClub));
            }
            this._window.visible = true;
        }

        private function exitQueue(k:WindowMouseEvent):void
        {
            if (messageListener == null)
            {
                return;
            }
            var _local_2:RoomWidgetRoomQueueMessage = new RoomWidgetRoomQueueMessage(RoomWidgetRoomQueueMessage.RWRQM_EXIT_QUEUE);
            messageListener.processWidgetMessage(_local_2);
            this.removeWindow();
        }

        private function openLink(k:WindowMouseEvent):void
        {
            messageListener.processWidgetMessage(new RoomWidgetRoomQueueMessage(RoomWidgetRoomQueueMessage.RWRQM_CLUB_LINK));
        }

        private function changeQueue(k:WindowMouseEvent):void
        {
            var _local_2:RoomWidgetRoomQueueMessage;
            if (messageListener == null)
            {
                return;
            }
            if (this._activeTarget == RoomWidgetRoomQueueUpdateEvent.RWRQUE_VISITOR_QUEUE_STATUS)
            {
                _local_2 = new RoomWidgetRoomQueueMessage(RoomWidgetRoomQueueMessage.RWRQM_CHANGE_TO_SPECTATOR_QUEUE);
            }
            else
            {
                _local_2 = new RoomWidgetRoomQueueMessage(RoomWidgetRoomQueueMessage.RWRQM_CHANGE_TO_VISITOR_QUEUE);
            }
            messageListener.processWidgetMessage(_local_2);
            this.removeWindow();
        }
    }
}
