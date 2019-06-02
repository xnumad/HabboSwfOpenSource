package com.sulake.habbo.ui.widget.furniture.video
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.handler.FurnitureYoutubeDisplayWidgetHandler;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.enum.WindowParam;
    import flash.system.Security;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.display.LoaderInfo;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.events.MouseEvent;
    import flash.display.DisplayObject;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubePlayListNode;
    import __AS3__.vec.Vector;

    public class YoutubeDisplayWidget extends ConversionTrackingWidget 
    {
        private static const _Str_13698:uint = 4291611903;
        private static const _Str_16441:uint = 0xFFFFFFFF;

        private var _habboTracking:IHabboTracking;
        private var _player:Object;
        private var _window:IWindowContainer;
        private var _roomObject:IRoomObject;
        private var _selectedItem:IWindowContainer;
        private var _itemTemplate:IWindow;
        private var _queuedVideoParams:Object;
        private var _currentVideoId:String;
        private var _canControlPlayback:Boolean;
        private var _currentVideoPlaybackState:int = -1;

        public function YoutubeDisplayWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboTracking)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._habboTracking = _arg_5;
            this._Str_2844.widget = this;
        }

        private function get _Str_2844():FurnitureYoutubeDisplayWidgetHandler
        {
            return _Str_2470 as FurnitureYoutubeDisplayWidgetHandler;
        }

        override public function get mainWindow():IWindow
        {
            return this._window;
        }

        public function show(k:IRoomObject, _arg_2:Boolean):void
        {
            this._roomObject = k;
            this._canControlPlayback = _arg_2;
            this.createWindow(_arg_2);
            this._window.visible = true;
        }

        private function createWindow(k:Boolean):void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = (windowManager.buildFromXML(XML(assets.getAssetByName("video_viewer_xml").content)) as IWindowContainer);
            if (k)
            {
                this._itemTemplate = IItemListWindow(this._window.findChildByName("playlists")).removeListItemAt(0);
            }
            else
            {
                this._window.findChildByName("right_pane").dispose();
                this._window.findChildByName("video_background").width = (this._window.width - 20);
                this._window.findChildByName("video_background").setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH);
                this._window.width = (this._window.width - 250);
            }
            this._window.procedure = this._Str_2533;
            this._window.center();
            this._Str_25201();
        }

        private function _Str_25201():void
        {
            Security.allowDomain("www.youtube.com");
            Security.allowDomain("ytimg.com");
            Security.allowDomain("s.ytimg.com");
            var k:Loader = new Loader();
            k.contentLoaderInfo.addEventListener(Event.INIT, this._Str_23038);
            k.load(new URLRequest("http://www.youtube.com/apiplayer?version=3"));
        }

        private function _Str_23038(k:Event):void
        {
            var _local_3:Loader;
            if (this._window == null)
            {
                return;
            }
            var _local_2:LoaderInfo = (k.target as LoaderInfo);
            if (_local_2)
            {
                _local_3 = _local_2.loader;
                IDisplayObjectWrapper(this._window.findChildByName("video_wrapper")).setDisplayObject(_local_3);
                _local_3.content.addEventListener("onReady", this._Str_16623);
                _local_3.content.addEventListener("onStateChange", this._Str_24061);
                _local_3.content.addEventListener(MouseEvent.MOUSE_UP, this._Str_11921);
                _local_3.content.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_11921);
            }
        }

        private function _Str_11921(k:MouseEvent):void
        {
            if (((!(this._window == null)) && (this._canControlPlayback)))
            {
                DisplayObject(k.target).stage.dispatchEvent(new MouseEvent(k.type));
                if ((((this._player) && (k.type == MouseEvent.MOUSE_UP)) && (!(this._currentVideoId == ""))))
                {
                    if (this._player.getPlayerState() == YoutubeVideoPlaybackStateEnum._Str_5825)
                    {
                        this._Str_2844.pauseVideo(this._roomObject.getId());
                    }
                    else
                    {
                        if (this._player.getPlayerState() == YoutubeVideoPlaybackStateEnum._Str_6168)
                        {
                            this._Str_2844._Str_25279(this._roomObject.getId());
                        }
                    }
                }
            }
        }

        private function _Str_16623(k:Event):void
        {
            var _local_2:IWindow;
            this._player = k.target;
            if (this._window != null)
            {
                _local_2 = this._window.findChildByName("video_wrapper");
                this._player.setSize(_local_2.width, _local_2.height);
                if (this._queuedVideoParams != null)
                {
                    this.loadVideo(this._queuedVideoParams);
                    this._queuedVideoParams = null;
                }
            }
            else
            {
                this._player.destroy();
            }
        }

        private function _Str_24061(k:Event):void
        {
            this._player = k.target;
            if (this._window != null)
            {
                switch (this._player.getPlayerState())
                {
                    case -1:
                    case 1:
                        if (this._currentVideoPlaybackState == 2)
                        {
                            this._player.pauseVideo();
                        }
                        return;
                }
            }
        }

        public function hide(k:IRoomObject):void
        {
            if (this._roomObject != k)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._itemTemplate != null)
            {
                this._itemTemplate.dispose();
                this._itemTemplate = null;
            }
            if (this._player != null)
            {
                this._player.destroy();
                this._player = null;
            }
            if (this._currentVideoId != null)
            {
                this._habboTracking.trackEventLog("YouTubeTVs", this._currentVideoId, "video.closed");
            }
            this._queuedVideoParams = null;
            this._selectedItem = null;
            this._roomObject = null;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            this.hide(this._roomObject);
            this._habboTracking = null;
            super.dispose();
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IItemListWindow;
            var _local_4:IWindow;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IWindow;
            var _local_8:int;
            var _local_9:IWindowContainer;
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    switch (_arg_2.name)
                    {
                        case "header_button_close":
                            this.hide(this._roomObject);
                            break;
                        case "playlist_prev":
                            this._Str_2844._Str_23793(this._roomObject.getId());
                            break;
                        case "playlist_next":
                            this._Str_2844._Str_23211(this._roomObject.getId());
                            break;
                        default:
                            if ((_arg_2 is IRegionWindow))
                            {
                                if (this._selectedItem != null)
                                {
                                    this._selectedItem.findChildByName("item_background").color = _Str_16441;
                                }
                                if (this._selectedItem == _arg_2)
                                {
                                    this._selectedItem = null;
                                    this._Str_2844._Str_19594(this._roomObject.getId(), "");
                                }
                                else
                                {
                                    this._selectedItem = (_arg_2 as IWindowContainer);
                                    this._selectedItem.findChildByName("item_background").color = _Str_13698;
                                    this._Str_2844._Str_19594(this._roomObject.getId(), this._selectedItem.name);
                                }
                                this._Str_2771();
                            }
                    }
                    return;
                case WindowEvent.WINDOW_EVENT_RESIZE:
                    switch (_arg_2.name)
                    {
                        case "video_viewer":
                            if (this._window != null)
                            {
                                _local_4 = this._window.findChildByName("right_pane");
                                if (_local_4 != null)
                                {
                                    _local_5 = (this._window.width - 29);
                                    _local_6 = (_local_5 * 0.66);
                                    _local_7 = this._window.findChildByName("video_background");
                                    _local_7.width = _local_6;
                                    _local_4.x = (_local_7.right + 9);
                                    _local_4.width = (_local_5 - _local_6);
                                }
                            }
                            break;
                        case "playlists":
                            _local_3 = (_arg_2 as IItemListWindow);
                            if (_local_3 != null)
                            {
                                _local_8 = 0;
                                while (_local_8 < _local_3.numListItems)
                                {
                                    _local_9 = (_local_3.getListItemAt(_local_8) as IWindowContainer);
                                    _local_9.findChildByName("item_background").width = _local_3.width;
                                    _local_9.findChildByName("item_contents").width = _local_3.width;
                                    _local_9.findChildByName("item_description").width = (_local_3.width - 22);
                                    _local_8++;
                                }
                            }
                            break;
                        case "video_wrapper":
                            if (this._player != null)
                            {
                                this._player.setSize(_arg_2.width, _arg_2.height);
                            }
                            break;
                    }
            }
        }

        public function showVideo(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            if (((this._roomObject == null) || (!(this._roomObject.getId() == k))))
            {
                return;
            }
            var _local_6:Object = (((_arg_3 > 0) || (_arg_4 > 0)) ? ({
"videoId":_arg_2,
"startSeconds":_arg_3,
"endSeconds":_arg_4,
"suggestedQuality":"large"
}) : ({
"videoId":_arg_2,
"suggestedQuality":"large"
}));
            if (this._player != null)
            {
                this.loadVideo(_local_6);
                this._queuedVideoParams = null;
            }
            else
            {
                this._queuedVideoParams = _local_6;
            }
            this._currentVideoPlaybackState = _arg_5;
        }

        public function _Str_22371(k:int, _arg_2:int):void
        {
            if (((this._roomObject == null) || (!(this._roomObject.getId() == k))))
            {
                return;
            }
            if (this._window != null)
            {
                if (this._player)
                {
                    switch (_arg_2)
                    {
                        case 1:
                            this._currentVideoPlaybackState = YoutubeVideoPlaybackStateEnum._Str_5825;
                            this._player.playVideo();
                            return;
                        case 2:
                            this._currentVideoPlaybackState = YoutubeVideoPlaybackStateEnum._Str_6168;
                            this._player.pauseVideo();
                            return;
                    }
                }
            }
        }

        private function loadVideo(k:Object):void
        {
            this._currentVideoId = k.videoId;
            var _local_2:* = (!(this._currentVideoId == ""));
            if (_local_2)
            {
                this._player.loadVideoById(k);
                this._habboTracking.trackEventLog("YouTubeTVs", this._currentVideoId, "video.started");
            }
            else
            {
                this._player.stopVideo();
            }
            if (this._window != null)
            {
                this._window.findChildByName("no_videos_label").visible = (!(_local_2));
                this._window.findChildByName("video_wrapper").visible = _local_2;
            }
        }

        public function _Str_24455(k:int, _arg_2:Vector.<YoutubePlayListNode>, _arg_3:String):void
        {
            var _local_5:YoutubePlayListNode;
            var _local_6:IWindowContainer;
            if (((((this._roomObject == null) || (!(this._roomObject.getId() == k))) || (this._window == null)) || (this._itemTemplate == null)))
            {
                return;
            }
            var _local_4:IItemListWindow = (this._window.findChildByName("playlists") as IItemListWindow);
            if (_local_4 == null)
            {
                return;
            }
            _local_4.destroyListItems();
            this._selectedItem = null;
            for each (_local_5 in _arg_2)
            {
                _local_6 = (this._itemTemplate.clone() as IWindowContainer);
                _local_6.name = _local_5.video;
                _local_6.findChildByName("item_background").width = _local_4.width;
                if (_local_5.video == _arg_3)
                {
                    _local_6.findChildByName("item_background").color = _Str_13698;
                    this._selectedItem = _local_6;
                }
                _local_6.findChildByName("item_contents").width = _local_4.width;
                _local_6.findChildByName("item_title").caption = _local_5.title;
                _local_6.findChildByName("item_description").caption = _local_5.description.replace(/\r/g, "");
                _local_6.findChildByName("item_description").width = (_local_4.width - 22);
                _local_4.addListItem(_local_6);
            }
            this._Str_2771();
        }

        private function _Str_2771():void
        {
            if (this._window == null)
            {
                return;
            }
            if (this._selectedItem != null)
            {
                this._window.findChildByName("playlist_prev").enable();
                this._window.findChildByName("playlist_next").enable();
            }
            else
            {
                this._window.findChildByName("playlist_prev").disable();
                this._window.findChildByName("playlist_next").disable();
            }
        }
    }
}
