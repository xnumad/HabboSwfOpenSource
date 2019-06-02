package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.habbo.navigator.UserCountRenderer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2632;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3560;
    import com.sulake.habbo.navigator.domain.Tabs;

    public class OfficialRoomEntryManager implements IDisposable 
    {
        private static const HOTTEST_GROUPS:String = "hottest_groups";
        private static const _Str_18121:int = 267;
        private static const _Str_19023:int = 65;
        private static const _Str_20053:int = -70;

        private var _disposed:Boolean;
        private var _navigator:IHabboTransitionalNavigator;
        private var _userCountRenderer:UserCountRenderer;

        public function OfficialRoomEntryManager(k:IHabboTransitionalNavigator):void
        {
            this._navigator = k;
            this._userCountRenderer = new UserCountRenderer(this._navigator);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._userCountRenderer)
            {
                this._userCountRenderer.dispose();
                this._userCountRenderer = null;
            }
            this._disposed = true;
        }

        public function _Str_21717(k:IWindowContainer):void
        {
            if (this._navigator.data._Str_5653 == null)
            {
                return;
            }
            var _local_2:String = "ad_footer";
            var _local_3:IWindowContainer = IWindowContainer(k.getChildByName("ad_footer"));
            var _local_4:IWindowContainer = IWindowContainer(_local_3.getChildByName("ad_cont"));
            if (_local_4.numChildren < 1)
            {
                _local_4.addChild(this._Str_9034(true));
            }
            var _local_5:IWindowContainer = IWindowContainer(_local_4.getChildAt(0));
            this._Str_2966(_local_5, true, this._navigator.data._Str_5653);
            _local_3.visible = true;
            this._navigator.data._Str_6357++;
        }

        public function _Str_9034(k:Boolean):IWindowContainer
        {
            var _local_5:IBitmapWrapperWindow;
            var _local_2:IWindowContainer = IWindowContainer(this._navigator.getXmlWindow("grs_official_room_row_phase_one"));
            var _local_3:IWindowContainer = IWindowContainer(_local_2.findChildByName("image_cont"));
            var _local_4:String = ((k) ? "" : "_b");
            this._navigator.refreshButton(_local_3, ("rico_rnd_l" + _local_4), true, null, 0);
            this._navigator.refreshButton(_local_3, ("rico_rnd_r" + _local_4), true, null, 0);
            _local_5 = (_local_3.findChildByName("rico_rnd_m") as IBitmapWrapperWindow);
            _local_5.bitmap = this._navigator._Str_3122("rico_rnd_m");
            _local_5.disposesBitmap = false;
            var _local_6:IWindowContainer = IWindowContainer(_local_2.findChildByName("folder_cont"));
            this._navigator.refreshButton(_local_6, ("rico_rnd_l" + _local_4), true, null, 0);
            this._navigator.refreshButton(_local_6, ("rico_rnd_r" + _local_4), true, null, 0);
            _local_5 = (_local_6.findChildByName("rico_rnd_m") as IBitmapWrapperWindow);
            _local_5.bitmap = this._navigator._Str_3122("rico_rnd_m");
            _local_5.disposesBitmap = false;
            _local_2.addEventListener(WindowMouseEvent.OVER, this._Str_22658);
            _local_2.addEventListener(WindowMouseEvent.OUT, this._Str_24237);
            _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_24488);
            _local_2.color = ((k) ? 0xFFFFFFFF : 4292797682);
            return _local_2;
        }

        public function _Str_2966(k:IWindowContainer, _arg_2:Boolean, _arg_3:_Str_2632):void
        {
            Util._Str_2930(k);
            if (_arg_2)
            {
                k.id = _arg_3.index;
                if (_arg_3.type == _Str_2632._Str_16098)
                {
                    this._Str_23826(k, _arg_3);
                }
                else
                {
                    this._Str_23189(k, _arg_3);
                }
                k.visible = true;
            }
            else
            {
                k.height = 0;
                k.visible = false;
            }
        }

        private function _Str_23189(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            this._Str_24261(k, _arg_2);
            this._Str_25008(k, _arg_2);
            this.refreshUserCount(k, _arg_2);
            k.height = 68;
        }

        private function _Str_23826(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:IWindowContainer = IWindowContainer(k.findChildByName("folder_cont"));
            _local_3.visible = true;
            var _local_4:ITextWindow = ITextWindow(_local_3.findChildByName("folder_name_text"));
            _local_4.text = _arg_2._Str_9428;
            var _local_5:ITextWindow = ITextWindow(_local_3.findChildByName("arrow_label"));
            _local_5.text = ((_arg_2.open) ? "${navigator.folder.hide}" : "${navigator.folder.show}");
            this._navigator.refreshButton(_local_3, "arrow_down_white", _arg_2.open, null, 0);
            this._navigator.refreshButton(_local_3, "arrow_right_white", (!(_arg_2.open)), null, 0);
            this._Str_24387(_local_3, _arg_2);
            k.height = 68;
            var _local_6:IWindowContainer = IWindowContainer(k.findChildByName("folderNameContainer"));
            if (_local_4.text == "")
            {
                _local_6.visible = false;
                return;
            }
            _local_6.visible = true;
            if (!this._navigator.isPerkAllowed("NAVIGATOR_PHASE_ONE_2014"))
            {
                _local_6.width = (_local_4.textWidth + 20);
            }
        }

        private function refreshUserCount(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            if (((_arg_2._Str_5386) && (_arg_2.type == _Str_2632._Str_12025)))
            {
                _local_3 = 3;
                _local_4 = 34;
                _local_5 = 13;
                this._userCountRenderer.refreshUserCount(_arg_2._Str_23003, k, _arg_2.userCount, "${navigator.usercounttooltip.users}", ((k.width - _local_3) - _local_4), ((k.height - _local_3) - _local_5));
            }
        }

        private function _Str_24261(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:IWindowContainer = IWindowContainer(k.findChildByName("image_cont"));
            _local_3.visible = true;
            _local_3.width = ((_arg_2._Str_5386) ? _Str_19023 : _Str_18121);
            this._Str_23785(_local_3, _arg_2);
            this._Str_25146(_local_3, _arg_2);
        }

        private function _Str_23785(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:IWindowContainer = IWindowContainer(k.findChildByName("picTextContainer"));
            if (((_arg_2.picText == "") || (_arg_2._Str_5386)))
            {
                _local_3.visible = false;
                return;
            }
            var _local_4:int = 5;
            _local_3.visible = true;
            var _local_5:ITextWindow = ITextWindow(_local_3.findChildByName("picText"));
            _local_5.text = _arg_2.picText;
            _local_5.height = (_local_5.textHeight + 10);
            var _local_6:* = (_local_5.textHeight > 10);
            _local_3.height = (_local_5.height + 4);
        }

        private function _Str_24387(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:IBitmapWrapperWindow = IBitmapWrapperWindow(k.findChildByName("folder_image"));
            _local_3.visible = false;
            if (_arg_2._Str_10304 != "")
            {
                this._Str_21174(_arg_2, _local_3);
            }
        }

        private function _Str_25146(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:IBitmapWrapperWindow = IBitmapWrapperWindow(k.findChildByName("room_image"));
            _local_3.visible = false;
            if (_arg_2._Str_10304 != "")
            {
                this._Str_21174(_arg_2, _local_3);
            }
            else
            {
                if (_arg_2._Str_5019 != null)
                {
                    this._Str_24128(k, _arg_2, _local_3);
                }
                else
                {
                    this._Str_24928(k, _arg_2, _local_3);
                }
            }
        }

        private function _Str_21174(k:_Str_2632, _arg_2:IBitmapWrapperWindow):void
        {
            var _local_3:String = ("customImage." + k._Str_10304);
            if (_arg_2.tags[0] == _local_3)
            {
                _arg_2.visible = true;
                return;
            }
            Logger.log(("Loading custom image: " + k._Str_10304));
            _arg_2.x = 0;
            _arg_2.visible = false;
            var _local_4:OfficialRoomImageLoader = new OfficialRoomImageLoader(this._navigator, k._Str_10304, _arg_2);
            _local_4._Str_24517();
            _arg_2.tags.splice(0, _arg_2.tags.length);
            _arg_2.tags.push(_local_3);
        }

        private function _Str_24128(k:IWindowContainer, _arg_2:_Str_2632, _arg_3:IBitmapWrapperWindow):void
        {
            var _local_4:String = ("guestRoom." + _arg_2._Str_5019.thumbnail._Str_22978());
            if (_arg_3.tags[0] == _local_4)
            {
                _arg_3.visible = true;
                return;
            }
            Logger.log("Redrawing guest room image");
            _arg_3.x = 0;
            _arg_3.width = 64;
            _arg_3.bitmap = new BitmapData(64, 64);
            _arg_3.bitmap.fillRect(_arg_3.bitmap.rect, 0xFFFFFFFF);
            _arg_3.tags.splice(0, _arg_3.tags.length);
            _arg_3.tags.push(_local_4);
            _arg_3.visible = true;
        }

        private function _Str_24928(k:IWindowContainer, _arg_2:_Str_2632, _arg_3:IBitmapWrapperWindow):void
        {
            var _local_4:String = "empty";
            if (_arg_3.tags[0] == _local_4)
            {
                _arg_3.visible = true;
                return;
            }
            Logger.log("Redrawing empty image");
            _arg_3.x = 0;
            _arg_3.width = 64;
            _arg_3.bitmap = new BitmapData(64, 64, false, 4291611852);
            _arg_3.tags.splice(0, _arg_3.tags.length);
            _arg_3.tags.push(_local_4);
            _arg_3.visible = true;
        }

        private function _Str_22658(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            this._Str_21153(_local_2, true);
        }

        private function _Str_24237(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            this._Str_21153(_local_2, false);
        }

        private function _Str_24488(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            this._Str_25371(_local_2);
        }

        private function _Str_21153(k:IWindow, _arg_2:Boolean):void
        {
            var _local_5:IBitmapWrapperWindow;
            var _local_3:IWindowContainer = IWindowContainer(k);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:IWindowContainer = IWindowContainer(_local_3.findChildByName("enter_room"));
            if (_local_4 == null)
            {
                return;
            }
            if (_arg_2)
            {
                this._navigator.refreshButton(_local_4, "enter_room_l", true, null, 0);
                this._navigator.refreshButton(_local_4, "enter_room_r", true, null, 0);
                _local_5 = IBitmapWrapperWindow(_local_4.findChildByName("enter_room_m"));
                if (_local_5.bitmap == null)
                {
                    _local_5.bitmap = this._navigator._Str_3122("enter_room_m");
                    _local_5.disposesBitmap = false;
                }
                this._navigator.refreshButton(_local_4, "enter_room_a", true, null, 0);
            }
            _local_4.visible = _arg_2;
        }

        private function _Str_25371(k:IWindow):void
        {
            var _local_2:_Str_2632 = this._Str_4666(k);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2._Str_5019 != null)
            {
                Logger.log(("ENTERING ROOM: " + _local_2._Str_5019.flatId));
                if (_local_2._Str_5019._Str_2738 == _Str_3560.DOORMODE_PASSWORD)
                {
                    this._navigator._Str_7174.show(_local_2._Str_5019);
                }
                else
                {
                    this._navigator.goToRoom(_local_2._Str_5019.flatId, true);
                }
            }
            else
            {
                if (_local_2.tag != null)
                {
                    Logger.log(("MAKING TAG SEARCH: " + _local_2.tag));
                    if (_local_2.tag == HOTTEST_GROUPS)
                    {
                        this._navigator.performGuildBaseSearch();
                    }
                    else
                    {
                        this._navigator._Str_2813._Str_2798(Tabs._Str_3813, Tabs._Str_5383, _local_2.tag);
                    }
                }
                else
                {
                    Logger.log(("FOLDER CLICKD: " + _local_2.index));
                    _local_2._Str_16147();
                    this._navigator._Str_2813.refresh();
                }
            }
        }

        private function _Str_4666(k:IWindow):_Str_2632
        {
            var _local_2:IWindowContainer = (k as IWindowContainer);
            if (((_local_2 == null) || (!(_local_2.name == "cont"))))
            {
                Logger.log("Target not cont");
                return null;
            }
            Logger.log(("PARENT NAME: " + k.parent.name));
            return (_local_2.parent.name == "ad_cont") ? this._Str_23608() : this._Str_23984(_local_2);
        }

        private function _Str_23608():_Str_2632
        {
            return this._navigator.data._Str_5653;
        }

        private function _Str_23984(k:IWindowContainer):_Str_2632
        {
            var _local_3:_Str_2632;
            if (this._navigator.data._Str_5645 == null)
            {
                Logger.log("No official rooms data click");
                return null;
            }
            var _local_2:int = k.id;
            Logger.log(("Got index: " + _local_2));
            for each (_local_3 in this._navigator.data._Str_5645.entries)
            {
                if (_local_3.index == _local_2)
                {
                    return _local_3;
                }
            }
            Logger.log(((("No room found " + _local_2) + ", ") + this._navigator.data._Str_5645.entries.length));
            return null;
        }

        private function _Str_25008(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:IWindowContainer = IWindowContainer(k.findChildByName("details_container"));
            _local_3.visible = _arg_2._Str_5386;
            Logger.log(("Refreshing details: " + _local_3.visible));
            if (!_arg_2._Str_5386)
            {
                return;
            }
            Util._Str_2930(_local_3);
            this._Str_22428(_local_3, _arg_2);
            this._Str_25192(_local_3, _arg_2);
        }

        private function _Str_22428(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:ITextWindow = ITextWindow(k.getChildByName("entry_caption"));
            _local_3.visible = true;
            _local_3.text = this._Str_24014(_arg_2);
        }

        private function _Str_25192(k:IWindowContainer, _arg_2:_Str_2632):void
        {
            var _local_3:String = this._Str_22796(_arg_2);
            if (_local_3 == "")
            {
                return;
            }
            var _local_4:String = "entry_desc";
            var _local_5:ITextWindow = ITextWindow(k.getChildByName(_local_4));
            _local_5.text = _local_3;
            _local_5.visible = true;
        }

        public function _Str_24014(k:_Str_2632):String
        {
            if (((!(k._Str_9428 == null)) && (!(k._Str_9428 == ""))))
            {
                return k._Str_9428;
            }
            if (k._Str_5019 != null)
            {
                return k._Str_5019.roomName;
            }
            if (((!(k.tag == null)) && (!(k.tag == ""))))
            {
                return k.tag;
            }
            return "NA";
        }

        public function _Str_22796(k:_Str_2632):String
        {
            if (((!(k._Str_9428 == null)) && (!(k._Str_9428 == ""))))
            {
                return k._Str_22426;
            }
            if (k._Str_5019 != null)
            {
                return k._Str_5019.description;
            }
            return "";
        }
    }
}
