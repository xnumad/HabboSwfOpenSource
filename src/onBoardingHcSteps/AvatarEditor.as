package onBoardingHcSteps
{
    import flash.display.Sprite;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar.enum.AvatarFigurePartType;
    import onBoardingHcUi._Str_951;
    import flash.utils.Dictionary;
    import flash.display.Bitmap;
    import onBoardingHcUi._Str_650;
    import onBoardingHcUi._Str_689;
    import onBoardingHcUi._Str_862;
    import onBoardingHcUi.RadioButtonGroup;
    import flash.external.ExternalInterface;
    import flash.events.Event;
    import flash.display.BlendMode;
    import onBoardingHcUi.LoaderUI;
    import flash.text.TextField;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import onBoardingHcUi._Str_662;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import onBoardingHcUi.ColorButton;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IPalette;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.structure.IStructureData;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.avatar.structure.figure.IFigurePart;
    import com.sulake.habbo.utils.HabboWebTools;
    import onBoardingHcSteps.images.*;

    public class AvatarEditor extends Sprite implements IAvatarImageListener 
    {
        private static const NEWUSERRECEPTION_SAVEOUTFIT:String = "NewUserReception.saveOutfit";
        private static const NEWUSERRECEPTIONSAVEOUTFITRESPONSE:String = "newUserReceptionSaveOutfitResponse";
        private static const NEWUSERRECEPTIONSAVEOUTFITFAILED:String = "newUserReceptionSaveOutfitFailed";
        private static const NEWUSERRETURNFROMPAYMENT:String = "newUserReturnFromPayment";
        private static const NEWUSERRECEPTION_NEWUSERCHECKHCMEMBERSHIP:String = "NewUserReception.newUserCheckHcMembership";
        private static const CHECKFORHCMEMBERSHIP:String = "checkForHcMembership";
        private static const _Str_1568:Array = ["hr-891-34.hd-209-10.ch-255-71.lg-280-81", "hr-893-42.hd-209-19.ch-230-80.lg-3290-82.sh-906-64", "hr-889-34.hd-200-1.ch-3030-73.lg-3023-88.sh-300-64", "hr-145-42.hd-185-1.ch-230-66.lg-270-82.sh-290-81", "hr-110-38.hd-190-1.ch-3030-85.lg-275-84.sh-290-74", "hr-891-42.hd-190-14.ch-230-64.lg-3290-64.sh-906-64", "hr-110-35.hd-185-1.ch-3110-80-25.lg-270-84.sh-905-80", "hr-145-43.hd-209-1.ch-809-80.lg-275-82.sh-906-64", "hr-889-42.hd-207-1370.ch-230-80.lg-280-80.sh-906-64", "hr-891-48.hd-200-1370.ch-809-84.lg-3290-84.sh-300-84", "hd-190-30.ch-230-82.lg-275-72.sh-905-88", "hd-185-10.ch-3110-85-25.lg-275-82.sh-300-84", "hr-893-40.hd-200-14.ch-255-75.lg-280-75.sh-906-75", "hr-889-45.hd-190-1370.ch-255-68.lg-3023-88.sh-906-68", "hr-110-45.hd-200-1371.ch-255-85.lg-280-84.sh-3068-85-25", "hr-893-35.hd-185-10.ch-230-1408.lg-275-72", "hr-145-42.hd-200-10.ch-255-64.lg-3290-64.sh-906-64", "hr-889-42.hd-209-10.ch-809-81.lg-3290-64.sh-300-64", "hr-110-39.hd-190-1371.ch-3110-80-25.lg-275-81.sh-3068-83-25", "hr-891-48.hd-185-20.ch-3030-71.lg-3023-80.sh-300-81", "hr-145-37.hd-200-1.ch-3030-75.lg-270-80.sh-3068-83-25", "hr-891-44.hd-207-1.ch-809-76.lg-270-76.sh-3068-76-25", "hr-145-48.hd-185-20.ch-3110-76-25.lg-270-74.sh-290-75", "hr-110-44.hd-200-30.ch-809-83.lg-270-84.sh-300-64", "hr-891-34.hd-207-14.ch-230-81.lg-270-76.sh-290-80"];
        private static const _Str_1942:Array = ["hr-891-40.hd-627-1371.ch-665-66.lg-700-82.sh-3068-68-25", "hr-515-48.hd-628-1.ch-635-73.lg-695-81.sh-735-83", "hr-891-35.hd-625-8.ch-685-73.lg-715-73.sh-907-73", "hr-837-45.hd-627-14.ch-670-76.lg-695-71.sh-907-73", "hr-892-48.hd-605-14.ch-685-64.lg-700-72.sh-906-64", "hr-893-32.hd-628-20.ch-823-76.lg-710-82.sh-735-76", "hr-892-32.hd-628-1.ch-665-81.lg-700-80.sh-3068-81-25", "hr-893-40.hd-610-12.ch-670-81.lg-716-81-25.sh-725-83", "hr-891-42.hd-625-10.ch-635-64.lg-695-64.sh-906-64", "hd-625-1370.ch-823-72.lg-710-74.sh-725-74", "hr-515-45.hd-628-1.ch-823-75.lg-710-73.sh-3068-84-25", "hr-893-34.hd-605-19.ch-685-84.lg-695-85.sh-906-85", "hr-837-39.hd-610-1.ch-685-91.lg-695-90.sh-906-80", "hr-891-34.hd-610-1369.ch-635-74.lg-695-82.sh-906-71", "hr-892-39.hd-628-1370.ch-670-64.lg-716-64-25.sh-907-64", "hr-837-46.hd-627-20.ch-665-76.lg-716-68-25", "hr-892-37.hd-605-10.ch-665-88.lg-700-88", "hr-892-48.hd-628-1371.ch-823-82.lg-700-71.sh-725-81", "hr-891-36.hd-625-8.ch-670-80.lg-715-80.sh-907-80", "hr-891-48.hd-628-12.ch-823-64.lg-715-64.sh-907-76", "hr-837-48.hd-627-14.ch-685-73.lg-695-76.sh-907-82", "hr-893-48.hd-605-1371.ch-665-74.lg-700-72.sh-725-74", "hr-515-35.hd-625-10.ch-665-72.lg-695-72.sh-906-64", "hr-837-35.hd-628-1.ch-635-81.lg-710-75.sh-735-81", "hr-893-44.hd-628-30.ch-670-76.lg-715-76.sh-907-76"];
        private static const _Str_1624:Class = AvatarEditor__Str_1624;
        private static const _Str_1109:Class = AvatarEditor__Str_1109;
        private static const _Str_2092:Class = AvatarEditor__Str_2092;
        private static const _Str_1231:Class = AvatarEditor__Str_1231;
        private static const _Str_1394:Class = AvatarEditor__Str_1394;
        private static const _Str_1918:Class = AvatarEditor__Str_1918;
        private static const _Str_1510:Class = AvatarEditor__Str_1510;
        private static const _Str_1203:Class = AvatarEditor__Str_1203;
        private static const _Str_1806:Class = AvatarEditor__Str_1806;
        private static const _Str_1764:Class = AvatarEditor__Str_1764;
        private static const _Str_986:Class = AvatarEditor__Str_986;
        public static const M:String = "M";
        public static const F:String = "F";
        public static const U:String = "U";
        private static const _Str_1647:int = 5;
        private static const _Str_1983:int = 5;
        private static const _Str_1650:int = 4;
        private static const _Str_1041:int = 4;
        private static const _Str_1500:int = 3;
        private static const _Str_1789:Array = [AvatarFigurePartType.HAIR, AvatarFigurePartType.HEAD, AvatarFigurePartType.CHEST, AvatarFigurePartType.LEGS, AvatarFigurePartType.SHOES];
        private static const _Str_1058:Array = [];

        private var _colorContainer:Sprite;
        private var _selectedFigureSet:_Str_951;
        private var _gender:String = "M";
        private var _thumbs:Dictionary;
        private var _colors:Dictionary;
        private var _figureSetData:Dictionary;
        private var _figureColorData:Dictionary;
        private var _currentSetId:String = "hr";
        private var _grid:Sprite;
        private var _extrasGrid:Sprite;
        private var _figureContainer:Bitmap;
        private var _randomizeButton:_Str_650;
        private var _context:OnBoardingHcFlow;
        private var _isDisposed:Boolean;
        private var _saveButton:_Str_689;
        private var _maleButton:_Str_862;
        private var _femaleButton:_Str_862;
        private var _genderButtonGroup:RadioButtonGroup;
        private var _clubParts:Array;
        private var _hcMemeber:Boolean;
        private var _balloonBox:Sprite;
        private var _hcResetDialog:Sprite;
        private var _showHcItems:Boolean;
        private var _gridButtons:Array;
        private var _hairButtons:Array;
        private var _selectedColors:Dictionary;
        private var _cloudAnimation:RandomAvatarCloudsAnimation;
        private var _multiColorSets:Dictionary;

        public function AvatarEditor(k:OnBoardingHcFlow)
        {
            this._clubParts = [];
            this._gridButtons = [];
            this._hairButtons = [];
            this._selectedColors = new Dictionary();
            this._multiColorSets = new Dictionary();
            super();
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(NEWUSERRECEPTIONSAVEOUTFITRESPONSE, this._Str_1477);
                ExternalInterface.addCallback(NEWUSERRECEPTIONSAVEOUTFITFAILED, this._Str_1074);
                ExternalInterface.addCallback(NEWUSERRETURNFROMPAYMENT, this._Str_1525);
                ExternalInterface.addCallback(CHECKFORHCMEMBERSHIP, this.checkForHcMembership);
            }
            this._context = k;
            this._gender = M;
            this._figureSetData = new Dictionary();
            this._figureColorData = new Dictionary();
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this._Str_583);
        }

        public function dispose():void
        {
            this._isDisposed = true;
            while (numChildren > 0)
            {
                removeChildAt(0);
            }
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        private function _Str_583(k:Event):void
        {
        }

        public function _Str_2039(k:Boolean):void
        {
            this._showHcItems = k;
        }

        private function _Str_1792():void
        {
            var k:int = this._context._Str_2051();
            var _local_2:int = this._context._Str_2203();
            this._figureContainer = new Bitmap();
            this._figureContainer.x = ((k + (_local_2 / 2)) + 15);
            this._figureContainer.y = 90;
            this._figureContainer.scaleX = 2;
            this._figureContainer.scaleY = 2;
            var _local_3:Bitmap = new _Str_1394();
            _local_3.x = (this._figureContainer.x + 35);
            _local_3.y = 290;
            _local_3.blendMode = BlendMode.OVERLAY;
            var _local_4:Bitmap = new _Str_1918();
            _local_4.x = (this._figureContainer.x - 55);
            _local_4.y = 90;
            _local_4.blendMode = BlendMode.ADD;
            addChild(_local_3);
            addChild(_local_4);
            addChild(this._figureContainer);
            this._cloudAnimation = new RandomAvatarCloudsAnimation();
            this._cloudAnimation.x = this._figureContainer.x;
            this._cloudAnimation.y = this._figureContainer.y;
            addChild(this._cloudAnimation);
            this._cloudAnimation.visible = false;
        }

        private function _Str_2062():void
        {
            var k:TextField = LoaderUI._Str_1132("headerText", 24, LoaderUI._Str_1232, false, true, false, false);
            k.width = 300;
            k.thickness = 50;
            addChild(k);
            k.htmlText = this._context.getString("onboarding.your.looks", "Choose looks");
            k.x = 35;
            k.y = 5;
            var _local_2:TextField = LoaderUI._Str_1132("headerText", 24, LoaderUI._Str_1232, false, true, false, false);
            _local_2.width = 300;
            _local_2.thickness = 50;
            addChild(_local_2);
            _local_2.htmlText = this._context.getString("onboarding.your.colour", "Choose colour");
            _local_2.x = 370;
            _local_2.y = 5;
            var _local_3:TextField = LoaderUI._Str_1132("headerText", 24, LoaderUI._Str_1232, false, true, false, false);
            _local_3.width = 300;
            _local_3.thickness = 50;
            addChild(_local_3);
            _local_3.htmlText = this._context.getString("onboarding.this.is.your.habbo", "This is your Habbo");
            _local_3.x = 700;
            _local_3.y = 5;
        }

        public function _Str_1354():void
        {
            var k:int = this._context._Str_2051();
            var _local_2:int = this._context._Str_2203();
            this._genderButtonGroup = new RadioButtonGroup(this._Str_1985);
            var _local_3:BitmapData = Bitmap(new _Str_2092()).bitmapData;
            var _local_4:BitmapData = Bitmap(new _Str_1624()).bitmapData;
            var _local_5:BitmapData = Bitmap(new _Str_1231()).bitmapData;
            var _local_6:BitmapData = Bitmap(new _Str_1109()).bitmapData;
            var _local_7:Sprite = new Sprite();
            x;
            _local_7.y = 105;
            this._maleButton = new _Str_862(this._context.getString("gender.male", "Male"), this._genderButtonGroup, LoaderUI._Str_1585, _local_3, _local_4, 8231575);
            this._maleButton.name = M;
            this._femaleButton = new _Str_862(this._context.getString("gender.female", "Female"), this._genderButtonGroup, LoaderUI._Str_1585, _local_5, _local_6, 8231575);
            this._femaleButton.name = F;
            _local_7.addChild(this._maleButton);
            _local_7.addChild(this._femaleButton);
            _local_7.x = (k + 120);
            addChild(_local_7);
            this._saveButton = new _Str_689(_Str_689.GFREEN, this._context.getString("onboarding.button.ready", "I'm ready"), new Rectangle(685, 435, 0, 40), true, this.saveOutfit, 0xD8D8D8);
            this._saveButton.x = ((k + ((_local_2 - this._saveButton.width) / 2)) + 20);
            addChild(this._saveButton);
            this._randomizeButton = new _Str_650(0, -10, this._Str_2106, 0xD8D8D8);
            _local_7.addChild(this._randomizeButton);
            LoaderUI._Str_2098(this._maleButton, 60, this._femaleButton, 30, this._randomizeButton);
            var _local_8:TextField = LoaderUI._Str_1132("bottomText", 12, LoaderUI._Str_1545, true, true, false, false);
            _local_8.htmlText = this._context.getString("onboarding.cant.decide", "Can't decide? Don't worry, you can change your clothes later!");
            _local_8.width = 300;
            _local_8.x = 715;
            _local_8.y = 380;
            addChild(_local_8);
        }

        private function _Str_1780():void
        {
            var k:Bitmap = Bitmap(new _Str_1203());
            this._balloonBox = new Sprite();
            addChild(this._balloonBox);
            var _local_2:Bitmap = LoaderUI._Str_2206(650, 160, 0, false, 861246, "none");
            this._balloonBox.addChild(_local_2);
            this._balloonBox.addChild(k);
            k.x = 20;
            k.y = 24;
            this._balloonBox.x = 41;
            this._balloonBox.y = 385;
            this._balloonBox.visible = true;
            var _local_3:TextField = LoaderUI._Str_1132(this._context.getString("onboard.what.is.hc.header", "Much more inside... "), 24, LoaderUI._Str_1232, true, true, false, false);
            var _local_4:String = this._context.getString("onboard.what.is.hc.description", "onboard.what.is.hc.description");
            var _local_5:TextField = LoaderUI._Str_1132(_local_4, 12, LoaderUI._Str_1545, true, true, false, false);
            _local_5.multiline = true;
            _local_5.width = 300;
            _local_3.width = 300;
            _local_3.x = 320;
            _local_3.y = 15;
            _local_5.x = 320;
            _local_5.y = 45;
            this._balloonBox.addChild(_local_3);
            this._balloonBox.addChild(_local_5);
            var _local_6:Bitmap = new _Str_1510();
            _local_6.x = 320;
            _local_6.y = -45;
            this._balloonBox.addChild(_local_6);
        }

        protected function onAddedToStage(k:Event):void
        {
            this._Str_1792();
            this._Str_2062();
            this._Str_1354();
            this._Str_1780();
            this._grid = new Sprite();
            this._grid.x = 40;
            this._grid.y = 50;
            addChild(this._grid);
            this._extrasGrid = new Sprite();
            this._extrasGrid.x = 40;
            this._extrasGrid.y = 365;
            addChild(this._extrasGrid);
            this._colorContainer = new Sprite();
            this._colorContainer.x = 375;
            this._colorContainer.y = 50;
            addChild(this._colorContainer);
            this._Str_1219();
            this._Str_1262();
            this._maleButton.selected = true;
            this._figureSetData[this._gender] = new Dictionary();
            this._figureColorData[this._gender] = new Dictionary();
            this._Str_1401();
        }

        private function _Str_1985():void
        {
            var k:_Str_862 = this._genderButtonGroup.selected;
            if (k == null)
            {
                return;
            }
            this._gender = k.name;
            this._context._Str_1829((this._gender == F));
            if (this._figureSetData[this._gender] == null)
            {
                this._figureSetData[this._gender] = new Dictionary();
                this._figureColorData[this._gender] = new Dictionary();
            }
            this._Str_1401();
        }

        private function _Str_1791():void
        {
            while (this._grid.numChildren > 0)
            {
                this._grid.removeChildAt(0);
            }
            while (this._extrasGrid.numChildren > 0)
            {
                this._extrasGrid.removeChildAt(0);
            }
            this._thumbs = new Dictionary();
        }

        private function _Str_1803():void
        {
            var k:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Array;
            var _local_6:String;
            var _local_7:Array;
            var _local_8:String;
            var _local_9:String;
            var _local_10:_Str_662;
            var _local_11:IAvatarImage;
            var _local_12:BitmapData;
            var _local_13:Array;
            var _local_14:int;
            var _local_15:int;
            var _local_16:String;
            this._Str_1791();
            this._Str_1023();
            _local_2 = 0;
            while (_local_2 < _Str_1789.length)
            {
                _local_8 = _Str_1789[_local_2];
                _local_5 = this._thumbs[_local_8];
                _local_13 = this._figureColorData[this._gender][_local_8];
                if (_local_8 == AvatarFigurePartType.HAIR)
                {
                    this._hairButtons = [];
                }
                _local_14 = _Str_1647;
                _local_15 = Math.min(_local_5.length, _local_14);
                k = 0;
                while (k < _local_15)
                {
                    _local_6 = _local_5[k];
                    _local_7 = _local_6.split("-");
                    _local_8 = _local_7[0];
                    _local_9 = _local_7[1];
                    if (((_local_13) && (_local_13.length > 1)))
                    {
                        this._multiColorSets[_local_9] = _local_13;
                    }
                    _local_3 = ((k * 50) + (k * 10));
                    _local_4 = ((_local_2 * 53) + (_local_2 * 10));
                    _local_10 = new _Str_662(_local_3, _local_4, this._Str_1575);
                    this._grid.addChild(_local_10);
                    this._gridButtons.push(_local_10);
                    if (_local_8 == AvatarFigurePartType.HAIR)
                    {
                        this._hairButtons.push(_local_10);
                    }
                    _local_11 = this._context._Str_1458.createAvatarImage(_local_7.concat(_local_13).join("-"), AvatarScaleType.LARGE);
                    _local_12 = _local_11._Str_818(((_local_8 == AvatarFigurePartType.HEAD) ? AvatarSetType.HEAD : AvatarSetType.FULL));
                    _local_10._Str_2233(_local_12);
                    _local_10.name = ((_local_8 + "_") + _local_9);
                    if (((!(this._selectedFigureSet == null)) && (_local_10.name == this._selectedFigureSet.name)))
                    {
                        _local_10.select();
                        this._selectedFigureSet = _local_10;
                        this._selectedFigureSet._Str_1854();
                    }
                    k++;
                }
                _local_2++;
            }
            _local_3 = 0;
            _local_2 = 0;
            while (_local_2 < _Str_1058.length)
            {
                _local_8 = _Str_1058[_local_2];
                _local_5 = this._thumbs[_local_8];
                _local_13 = this._figureColorData[this._gender][_local_8];
                k = 0;
                while (k < _local_5.length)
                {
                    _local_6 = _local_5[k];
                    _local_7 = _local_6.split("-");
                    _local_8 = _local_7[0];
                    _local_9 = _local_7[1];
                    _local_3 = (_local_3 + 60);
                    _local_4 = 0;
                    _local_10 = new _Str_662(_local_3, _local_4, this._Str_1575);
                    this._extrasGrid.addChild(_local_10);
                    this._gridButtons.push(_local_10);
                    _local_16 = ((_local_13 != null) ? _local_7.concat(_local_13).join("-") : _local_6);
                    _local_11 = this._context._Str_1458.createAvatarImage(_local_16, AvatarScaleType.LARGE);
                    _local_10._Str_2233(_local_11._Str_818(((_local_8 == AvatarFigurePartType.HEAD) ? AvatarSetType.HEAD : AvatarSetType.FULL)));
                    _local_10.name = ((_local_8 + "_") + _local_9);
                    if (((!(this._selectedFigureSet == null)) && (_local_10.name == this._selectedFigureSet.name)))
                    {
                        _local_10.select();
                        this._selectedFigureSet = _local_10;
                    }
                    k++;
                }
                _local_2++;
            }
            this._Str_1856();
        }

        private function updateFigure():void
        {
            var _local_2:BitmapData;
            var k:IAvatarImage = this._context._Str_1458.createAvatarImage(this._Str_784(), AvatarScaleType.LARGE, this._gender, this);
            if (k)
            {
                k.setDirection(AvatarSetType.FULL, 4);
                _local_2 = k.getImage(AvatarSetType.FULL, false);
                if (_local_2)
                {
                    this._figureContainer.bitmapData = _local_2;
                }
            }
            this._Str_1856();
        }

        public function _Str_784():String
        {
            var _local_3:String;
            var _local_4:int;
            var _local_5:Array;
            var _local_6:ColorButton;
            var k:Boolean;
            var _local_2:Array = [];
            if (((this._figureSetData) && (this._figureSetData[this._gender])))
            {
                for (_local_3 in this._figureSetData[this._gender])
                {
                    _local_4 = this._figureSetData[this._gender][_local_3];
                    _local_5 = this._figureColorData[this._gender][_local_3];
                    if (((_local_5) && (_local_5.length > 1)))
                    {
                        _local_5[1] = "25";
                    }
                    _local_2.push([_local_3, _local_4].concat(_local_5).join("-"));
                    if (!k)
                    {
                        k = (this._clubParts.indexOf(_local_4) > -1);
                        _local_6 = this._selectedColors[_local_3];
                        if (((!(_local_6 == null)) && (_local_6.club)))
                        {
                            k = true;
                        }
                    }
                }
            }
            return _local_2.join(".");
        }

        public function _Str_1401():void
        {
            var _local_5:Array;
            var _local_6:ColorButton;
            var _local_7:ColorButton;
            var _local_8:String;
            var _local_10:_Str_951;
            var _local_11:Array;
            var _local_12:Array;
            var _local_13:String;
            var _local_14:int;
            var k:String = this._Str_1438();
            var _local_2:Array = k.split(".");
            var _local_3:Dictionary = this._figureSetData[this._gender];
            var _local_4:int;
            var _local_9:int;
            while (_local_9 < _local_2.length)
            {
                _local_11 = String(_local_2[_local_9]).split("-");
                _local_12 = [];
                if (_local_11.length >= 3)
                {
                    _local_13 = _local_11[0];
                    if (_local_3[_local_13] == _local_11[1])
                    {
                        _local_4++;
                    }
                    this._figureSetData[this._gender][_local_13] = _local_11[1];
                    _local_12.push(_local_11[2]);
                    _local_5 = this._colors[_local_13];
                    _local_14 = 0;
                    while (_local_14 < _local_5.length)
                    {
                        _local_6 = _local_5[_local_14];
                        if (_local_6.name == ((_local_13 + "_") + _local_11[2]))
                        {
                            this._Str_1495(_local_6);
                        }
                        _local_14++;
                    }
                    if (_local_11.length > 3)
                    {
                        _local_12.push(_local_11[3]);
                    }
                    this._figureColorData[this._gender][_local_13] = _local_12;
                }
                if (_local_13 == AvatarFigurePartType.HAIR)
                {
                    _local_8 = ((_local_13 + "_") + _local_11[1]);
                    _local_7 = _local_6;
                }
                _local_9++;
            }
            this._currentSetId = AvatarFigurePartType.HAIR;
            for each (_local_10 in this._hairButtons)
            {
                if (_local_10.name == _local_8)
                {
                    this._Str_1575(_local_10);
                    this._Str_1575(_local_10);
                }
            }
            this._cloudAnimation.visible = true;
            this._cloudAnimation._Str_1480();
            if (_local_4 >= (_local_2.length - 1))
            {
                this._Str_1401();
            }
        }

        private function _Str_1438():String
        {
            var k:Array;
            var _local_2:int;
            if (this._gender == M)
            {
                k = _Str_1568;
            }
            else
            {
                k = _Str_1942;
            }
            var _local_3:int = int((Math.random() * (k.length - 1)));
            var _local_4:String = k[_local_3];
            return _local_4;
        }

        private function _Str_1023():void
        {
            var k:String;
            var _local_2:Array;
            this._thumbs = new Dictionary();
            for each (k in _Str_1789)
            {
                _local_2 = this._Str_1445(k);
                this._thumbs[k] = _local_2;
            }
            this._thumbs[AvatarFigurePartType.EYE_ACCESSORY] = this._Str_1445(AvatarFigurePartType.EYE_ACCESSORY);
            this._thumbs[AvatarFigurePartType.FACE_ACCESSORY] = this._Str_1445(AvatarFigurePartType.FACE_ACCESSORY);
            this._thumbs[AvatarFigurePartType.HEAD_ACCESSORY] = this._Str_1445(AvatarFigurePartType.HEAD_ACCESSORY);
        }

        private function _Str_1219():void
        {
            var _local_5:String;
            var _local_6:ISetType;
            var _local_7:IPalette;
            var _local_8:Array;
            var _local_9:Array;
            var _local_10:Array;
            var _local_11:IPartColor;
            var k:IStructureData = this._context._Str_1458._Str_813();
            this._colors = new Dictionary();
            var _local_2:int = (_Str_1041 * _Str_1650);
            var _local_3:int = (_Str_1500 * _Str_1650);
            var _local_4:int = (_local_2 - _local_3);
            for each (_local_5 in AvatarFigurePartType.FIGURE_SETS)
            {
                _local_6 = k._Str_740(_local_5);
                _local_7 = k.getPalette(_local_6._Str_734);
                _local_8 = [];
                _local_9 = [];
                _local_10 = [];
                for each (_local_11 in _local_7.colors)
                {
                    if (((_local_11.isSelectable) && ((_local_10.length + _local_9.length) < _local_2)))
                    {
                        _local_9.push(this._Str_1378(_local_11, _local_5));
                    }
                }
                _local_10.sort(this._Str_1367);
                _local_9.sort(this._Str_1367);
                _local_8 = _local_9.concat(_local_10);
                this._colors[_local_5] = _local_8;
            }
        }

        private function _Str_1378(k:IPartColor, _arg_2:String):ColorButton
        {
            var _local_3:ColorButton = new ColorButton(0, 0, this._Str_1495, 0xFFFFFF, k._Str_915);
            _local_3.name = ((_arg_2 + "_") + k.id);
            _local_3.setColor(k._Str_915);
            _local_3.index = k.index;
            _local_3.club = (k.clubLevel > 0);
            return _local_3;
        }

        private function _Str_1367(k:ColorButton, _arg_2:ColorButton):Number
        {
            if (k.index < _arg_2.index)
            {
                return -1;
            }
            if (k.index > _arg_2.index)
            {
                return 1;
            }
            return 0;
        }

        private function _Str_1495(k:ColorButton):void
        {
            var _local_5:Array;
            var _local_7:String;
            var _local_8:ColorButton;
            var _local_9:String;
            var _local_2:Array = k.name.split("_");
            var _local_3:String = _local_2[0];
            var _local_4:String = _local_2[1];
            var _local_6:Array = [];
            _local_6.push(_local_4);
            for (_local_7 in this._figureSetData[this._gender])
            {
                _local_9 = this._figureSetData[this._gender][_local_7];
                _local_5 = this._multiColorSets[_local_9];
                if (_local_3 == _local_7)
                {
                    _local_5 = this._multiColorSets[_local_9];
                    if (((_local_5) && (_local_5.length > 1)))
                    {
                        _local_6.push("25");
                    }
                }
            }
            this._figureColorData[this._gender][_local_3] = _local_6;
            _local_8 = this._selectedColors[_local_3];
            if (_local_8)
            {
                _local_8.unselect();
            }
            this._selectedColors[_local_3] = k;
            k.select();
            this._Str_1803();
            this.updateFigure();
        }

        private function _Str_1262():void
        {
            var _local_3:_Str_951;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            while (this._colorContainer.numChildren > 0)
            {
                this._colorContainer.removeChildAt(0);
            }
            var k:Array = this._colors[this._currentSetId];
            if (k == null)
            {
                return;
            }
            var _local_2:int;
            for each (_local_3 in k)
            {
                this._colorContainer.addChild(_local_3);
                _local_4 = (_local_2 % _Str_1650);
                _local_5 = (_local_2 / _Str_1650);
                _local_6 = ((_local_4 * 50) + (_local_4 * 2));
                _local_7 = ((_local_5 * 53) + (_local_5 * 10));
                _local_3.x = _local_6;
                _local_3.y = _local_7;
                _local_2++;
            }
        }

        private function _Str_1445(k:String):Array
        {
            var _local_6:IFigurePartSet;
            var _local_8:Boolean;
            var _local_9:int;
            var _local_10:IFigurePart;
            var _local_11:Array;
            var _local_12:IPartColor;
            var _local_13:Array;
            var _local_14:int;
            var _local_15:IPartColor;
            var _local_16:int;
            var _local_2:Array = [];
            var _local_3:IStructureData = this._context._Str_1458._Str_813();
            var _local_4:ISetType = _local_3._Str_740(k);
            var _local_5:IPalette = _local_3.getPalette(_local_4._Str_734);
            var _local_7:int;
            if (((_local_4) && (_local_5)))
            {
                for each (_local_6 in _local_4._Str_710)
                {
                    _local_8 = true;
                    if (_local_6.clubLevel > 0)
                    {
                        _local_8 = this._showHcItems;
                    }
                    if ((((_local_8) && (_local_6.isPreSelectable)) && ((_local_6.gender == this._gender) || (_local_6.gender == U))))
                    {
                        _local_9 = 0;
                        for each (_local_10 in _local_6.parts)
                        {
                            _local_9 = Math.max(_local_9, _local_10._Str_827);
                        }
                        _local_11 = [];
                        for each (_local_12 in _local_5.colors)
                        {
                            if (_local_12.isSelectable)
                            {
                                _local_11.push(_local_12);
                            }
                        }
                        _local_13 = [];
                        if (_local_11.length > 0)
                        {
                            _local_14 = int((Math.random() * (_local_11.length - 1)));
                            _local_15 = _local_11[_local_14];
                            _local_16 = 0;
                            while (_local_16 < _local_9)
                            {
                                _local_16++;
                            }
                        }
                        _local_2.push([k, _local_6.id].concat(_local_13).join("-"));
                        _local_7++;
                        if (_local_7 == _Str_1983)
                        {
                            break;
                        }
                    }
                }
            }
            return _local_2;
        }

        private function _Str_1384():Array
        {
            var k:Array = [];
            var _local_2:int;
            while (_local_2 < _Str_1789.length)
            {
                k.push(("" + this._figureSetData[this._gender][_Str_1789[_local_2]]));
                _local_2++;
            }
            _local_2 = 0;
            while (_local_2 < _Str_1058.length)
            {
                k.push(("" + this._figureSetData[this._gender][_Str_1058[_local_2]]));
                _local_2++;
            }
            return k;
        }

        private function _Str_1856():void
        {
            var _local_2:_Str_662;
            var _local_3:Array;
            var _local_4:String;
            var _local_5:String;
            var k:Array = this._Str_1384();
            for each (_local_2 in this._gridButtons)
            {
                _local_3 = _local_2.name.split("_");
                _local_4 = _local_3[0];
                _local_5 = _local_3[1];
                if (k.indexOf(_local_5) > -1)
                {
                    _local_2.select();
                }
                else
                {
                    _local_2.unselect();
                }
            }
        }

        private function _Str_1575(k:_Str_951):void
        {
            var _local_2:Array = k.name.split("_");
            var _local_3:String = _local_2[0];
            var _local_4:String = _local_2[1];
            var _local_5:Array = this._Str_1384();
            if (this._selectedFigureSet)
            {
                this._selectedFigureSet.unselect();
            }
            var _local_6:* = (this._selectedFigureSet == k);
            _local_6 = (_local_5.indexOf(_local_4) > -1);
            this._selectedFigureSet = k;
            if ((((_local_3 == AvatarFigurePartType.HEAD) || (_local_3 == AvatarFigurePartType.LEGS)) || ((this._gender == F) && (_local_3 == AvatarFigurePartType.CHEST))))
            {
                _local_6 = false;
            }
            this._currentSetId = _local_3;
            if (_local_6)
            {
                delete this._figureSetData[this._gender][this._currentSetId];
                this._selectedFigureSet = null;
            }
            else
            {
                this._figureSetData[this._gender][this._currentSetId] = _local_4;
                this._selectedFigureSet.select();
                this._selectedFigureSet._Str_1854();
            }
            this.updateFigure();
            this._Str_1262();
        }

        public function _Str_840(k:String):void
        {
            var _local_2:IAvatarImage = this._context._Str_1458.createAvatarImage(k, AvatarScaleType.LARGE);
            var _local_3:BitmapData = _local_2.getImage(AvatarSetType.FULL, false);
            if (_local_3)
            {
                this._figureContainer.bitmapData = _local_3;
            }
        }

        private function _Str_1525():void
        {
            HabboWebTools.closeWebPageAndRestoreClient();
            if (ExternalInterface.available)
            {
                ExternalInterface.call(NEWUSERRECEPTION_NEWUSERCHECKHCMEMBERSHIP);
            }
        }

        public function checkForHcMembership(k:String):void
        {
            switch (k)
            {
                case "OK":
                    this._hcMemeber = true;
                    this._Str_1219();
                    if (this._hcResetDialog)
                    {
                        this._hcResetDialog.visible = false;
                    }
                    return;
            }
        }

        private function saveOutfit(k:_Str_951):void
        {
            if (ExternalInterface.available)
            {
                ExternalInterface.call(NEWUSERRECEPTION_SAVEOUTFIT, this._Str_784(), this._gender.toLowerCase());
            }
            else
            {
                this._context._Str_931();
            }
        }

        private function _Str_1477(k:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:Boolean;
            switch (_arg_3)
            {
                case "OK":
                    _local_4 = true;
                    break;
                case "INVALID_FIGURE":
                    break;
                case "FIGURE_UPDATE_CHANGE_NOT_ALLOWED":
                    break;
            }
            if (_local_4)
            {
                this._context._Str_1171();
            }
            else
            {
                this._context._Str_657(this._context.getString("figure.ok", "Figure change ok!"));
            }
        }

        private function _Str_1074(k:String, _arg_2:String):void
        {
            this._context._Str_657(this._context.getString("figure.error", "Figure change error!"));
        }

        public function _Str_943(k:Boolean=false):void
        {
            if (ExternalInterface.available)
            {
                Logger.log(("Save outfit: " + [this._Str_784(), this._gender]));
            }
            else
            {
                this._context._Str_931();
            }
        }

        public function _Str_2238(k:Boolean=false):void
        {
            this._grid.visible = k;
            this._colorContainer.visible = k;
            this._maleButton.visible = k;
            this._femaleButton.visible = k;
            this._saveButton.visible = k;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function _Str_909(k:Boolean):void
        {
            this._saveButton.visible = k;
        }

        public function _Str_2106(k:_Str_951):void
        {
            this._Str_1401();
        }
    }
}



