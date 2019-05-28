package onBoardingHcSteps
{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.Sprite;
    import flash.text.TextField;
    import onBoardingHcUi._Str_951;
    import flash.display.Bitmap;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import onBoardingHcUi.LoaderUI;
    import flash.events.MouseEvent;
    import onBoardingHcUi._Str_689;
    import flash.geom.Rectangle;
    import flash.display.DisplayObject;
    import onBoardingHcSteps.images.*;

    public class RoomPicker implements IDisposable 
    {
        private static const _Str_2261:Class = RoomPicker__Str_2261;
        private static const _Str_1971:Class = RoomPicker__Str_1971;
        private static const NEWUSERRECEPTION_CHOOSEROOM:String = "NewUserReception.chooseRoom";
        private static const NEWUSERRECEPTIONCHOOSEROOMRESPONSE:String = "newUserReceptionChooseRoomResponse";
        private static const NEWUSERRECEPTIONCHOOSEROOMFAILED:String = "newUserReceptionChooseRoomFailed";

        private var _roomImages:Array;
        private var _numOfRooms:int;
        private var _newUserFlow:OnBoardingHcFlow;
        private var _container:Sprite;
        private var _chooserPanel:Sprite;
        private var _chosenRoomIndex:int = 1;
        private var _roomTypes:Array;
        private var _roomDescription:TextField;
        private var _roomName:TextField;
        private var _selectButton:_Str_951;
        private var _roomImageContainers:Array;
        private var _chosenIcon:Bitmap;
        private var _imagesToLoad:int = 0;
        private var _spaceBetweenImages:int = 30;

        public function RoomPicker(k:OnBoardingHcFlow, _arg_2:Sprite)
        {
            this._roomImages = [];
            this._roomImageContainers = [];
            super();
            this._newUserFlow = k;
            this._container = _arg_2;
        }

        public function _Str_1377():void
        {
            var _local_2:Loader;
            var _local_3:URLRequest;
            this._roomTypes = this._newUserFlow.getString("roomTypes", "").split(",");
            this._numOfRooms = this._roomTypes.length;
            var k:int;
            while (k < this._numOfRooms)
            {
                _local_2 = new Loader();
                _local_3 = new URLRequest((((this.galleryUrl + "nux_room_") + this._roomTypes[k]) + "_round.png"));
                _local_2.load(_local_3);
                _local_2.contentLoaderInfo.addEventListener(Event.COMPLETE, this._Str_1284);
                this._roomImages.push(_local_2);
                k++;
            }
        }

        private function get galleryUrl():String
        {
            var k:String = this._newUserFlow.getString("galleryUrl", null);
            if (((k == null) || (k.length < 2)))
            {
                return "/c_images/nux/";
            }
            if (k.lastIndexOf("/") != (k.length - 1))
            {
                k = (k + "/");
            }
            if (k.substr(0, 2) == "//")
            {
                k = (((this._newUserFlow.loaderInfo.url.indexOf("https:") == 0) ? "https:" : "http:") + k);
            }
            return k;
        }

        public function init():void
        {
            if (this._roomTypes == null)
            {
                this._Str_1377();
            }
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(NEWUSERRECEPTIONCHOOSEROOMRESPONSE, this._Str_1314);
                ExternalInterface.addCallback(NEWUSERRECEPTIONCHOOSEROOMFAILED, this._Str_1705);
            }
        }

        public function _Str_1355():void
        {
            var _local_4:Sprite;
            var _local_5:Sprite;
            var _local_6:Loader;
            var _local_7:int;
            var k:TextField = LoaderUI._Str_1132("headerText", 24, LoaderUI._Str_1232, false, true, false, false);
            k.width = 500;
            k.thickness = 50;
            this._container.addChild(k);
            k.htmlText = this._newUserFlow.getString("onboarding.room.information", "Choose your first room. This room gets you started. You can create more free rooms later, if you like.");
            k.multiline = true;
            k.x = 25;
            k.y = -70;
            var _local_2:int;
            while (_local_2 < this._numOfRooms)
            {
                _local_5 = new Sprite();
                _local_6 = (this._roomImages[_local_2] as Loader);
                if (_local_6 != null)
                {
                    _local_5.addChild(_local_6);
                }
                this._container.addChild(_local_5);
                this._roomImageContainers.push(_local_5);
                _local_5.name = String((_local_2 + 1));
                _local_5.addEventListener(MouseEvent.CLICK, this._Str_1106);
                _local_7 = (((_local_2 + 1) * this._spaceBetweenImages) + (_local_2 * 280));
                _local_5.x = _local_7;
                _local_5.y = 10;
                _local_2++;
            }
            this._chooserPanel = new Sprite();
            this._container.addChild(this._chooserPanel);
            this._selectButton = new _Str_689(_Str_689.GFREEN, this._newUserFlow.getString("room.select", "Select"), new Rectangle(0, 0, 0, 40), true, this._Str_1782);
            var _local_3:Bitmap = LoaderUI._Str_2206(640, 100, 0, false, 995918, "none");
            this._chooserPanel.addChild(_local_3);
            _local_3.x = this._spaceBetweenImages;
            LoaderUI._Str_2047(_local_5, 20, _local_3);
            _local_4 = new Sprite();
            _local_4.addChild(this._selectButton);
            this._container.addChild(_local_4);
            _local_4.x = 725;
            _local_4.y = 360;
            if (!this._roomDescription)
            {
                this._roomDescription = LoaderUI._Str_1132(this._newUserFlow.getString("receptionist.start.title", "Hiya!"), 18, LoaderUI._Str_1232, false);
                this._roomName = LoaderUI._Str_1132(this._newUserFlow.getString("onboarding.hint.hc", "Room name"), 20, 0xFFFFFF, false, true, false, false);
                this._roomName.width = 260;
                this._roomName.x = 50;
                this._roomDescription.x = 50;
                this._roomDescription.width = 260;
                LoaderUI._Str_2047(_local_5, 30, this._roomName);
                LoaderUI._Str_2047(_local_5, 55, this._roomDescription);
                this._chooserPanel.addChild(this._roomDescription);
                this._chooserPanel.addChild(this._roomName);
            }
            this._chosenRoomIndex = 1;
            if (!this._chosenIcon)
            {
                this._chosenIcon = Bitmap(new _Str_1971());
                this._chooserPanel.addChild(this._chosenIcon);
            }
            this._chooserPanel.visible = (this._imagesToLoad == this._numOfRooms);
            this._selectButton.visible = (this._imagesToLoad == this._numOfRooms);
            this.chooseRoom();
        }

        private function _Str_1634():void
        {
            var k:String = this._roomTypes[(this._chosenRoomIndex - 1)];
            this._roomName.text = this._newUserFlow.getString(("room.name." + k), ("Room " + k));
            this._roomDescription.text = this._newUserFlow.getString(("room.description." + k), "\nTwo-line description");
        }

        private function _Str_1782(k:DisplayObject):void
        {
            if (ExternalInterface.available)
            {
                ExternalInterface.call(NEWUSERRECEPTION_CHOOSEROOM, this._chosenRoomIndex);
            }
        }

        private function _Str_1106(k:Event):void
        {
            this._chosenRoomIndex = int(k.currentTarget.name);
            this.chooseRoom();
        }

        private function _Str_1284(k:Event):void
        {
            this._imagesToLoad++;
            if (this._imagesToLoad == this._numOfRooms)
            {
                this._Str_1355();
            }
        }

        private function chooseRoom():void
        {
            var k:Sprite = this._roomImageContainers[(this._chosenRoomIndex - 1)];
            if (k == null)
            {
                return;
            }
            this._chosenIcon.x = k.x;
            this._chosenIcon.y = ((k.y + k.height) - this._chosenIcon.height);
            this._chosenIcon.visible = true;
            this._selectButton.visible = (this._imagesToLoad == this._numOfRooms);
            this._Str_1634();
        }

        public function _Str_1314():void
        {
            this._newUserFlow._Str_1411();
        }

        public function _Str_1705():void
        {
            this._newUserFlow._Str_1411();
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._container)
            {
                while (this._container.numChildren > 0)
                {
                    this._container.removeChildAt(0);
                }
            }
            this._container = null;
            this._roomImages = null;
            this._newUserFlow = null;
        }

        public function get disposed():Boolean
        {
            return this._newUserFlow == null;
        }
    }
}
