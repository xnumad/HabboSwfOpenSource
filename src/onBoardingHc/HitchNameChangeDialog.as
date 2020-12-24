package onBoardingHc
{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.text.TextField;
    import onBoardingHcUi.LoaderUI;
    import flash.geom.Rectangle;
    import onBoardingHcUi.NineSplitSprite;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import onBoardingHcUi.WaitIndicator;
    import onBoardingHc.images.*;

    public class HitchNameChangeDialog extends NameChangeDialog
    {
        private var _Str_1473:Class;
        private var _Str_1461:Class;

        public function HitchNameChangeDialog(k:IUIContext, _arg_2:Sprite, _arg_3:int)
        {
            this._Str_1473 = _Str_752;
            this._Str_1461 = _Str_811;
            super(k, _arg_2, _arg_3);
        }

        override protected function init():void
        {
            var _local_2:int;
            var _local_5:Sprite;
            var _local_6:Bitmap;
            var _local_7:TextField;
            _style = LoaderUI._Str_1585;
            _nameChangeDialog = LoaderUI.createFrame("", "", new Rectangle((-(_Str_2083) / 2), 0, _Str_2083, 1), _style);
            _container.addChild(_nameChangeDialog);
            var k:int;
            _local_2 = 330;
            var _local_3:int = (_Str_2083 - 12);
            var _local_4:Boolean;
            _local_5 = new Sprite();
            _Str_1260 = NineSplitSprite._Str_2099.render(_local_2, 31);
            _local_5.addChild(_Str_1260);
            _nameChangeDialog.addChild(_local_5);
            _local_5.x = k;
            _local_6 = null;
            _local_7 = LoaderUI.createTextField(_context.getString("onboarding.characters.tip", "TIP: There are tons of Habbos created every day"), 18, LoaderUI._Str_1232, false, true, false, false);
            _local_7.width = (_local_2 - 32);
            var _local_8:TextField = LoaderUI.createTextField(_context.getString("onboarding.creative.tip", "be creative! You can also use these special characters"), 18, LoaderUI._Str_1232, false, true, false, false);
            _local_8.width = (_local_2 - 32);
            _Str_1482 = new Sprite();
            var _local_9:Bitmap = LoaderUI.createBalloon(295, 230, 45, false, 995918, "down");
            _local_9.y = 90;
            _Str_1482.addChild(_local_9);
            _Str_1482.addChild(_local_7);
            _Str_1482.addChild(_local_8);
            _local_7.x = 16;
            _local_7.y = (_local_9.y + ((_local_9.height - (_local_7.height + _local_8.height)) / 2));
            _local_7.width = 250;
            _Str_1482.visible = false;
            _local_8.x = 16;
            _local_8.y = ((_local_7.y + _local_7.height) + 20);
            _local_8.width = 250;
            if (_local_6 != null)
            {
                _Str_1482.addChild(_local_6);
                _local_6.x = 16;
                _local_6.y = int(((_Str_1482.height - _local_6.height) / 2));
            }
            _nameChangeDialog.addChild(_Str_1482);
            _Str_1482.x = k;
            _Str_1156 = _context.getString("name", "Enter name here");
            _inputField = LoaderUI.createTextField(_Str_1156, 18, 0x666666, true, false, true, false);
            _nameChangeDialog.addChild(_inputField);
            _inputField.x = (_local_5.x + 16);
            _inputField.y = (_local_5.y + int(((_local_5.height - _inputField.height) / 2)));
            _inputField.width = (_local_5.width - 30);
            _inputField.addEventListener(MouseEvent.CLICK, _Str_2136);
            _inputField.addEventListener(Event.CHANGE, _Str_1552);
            _tickMark = new this._Str_1473();
            _nameChangeDialog.addChild(_tickMark);
            _tickMark.y = (_local_5.y + int(((_local_5.height - _tickMark.height) / 2)));
            _tickMark.x = (((_local_5.x + _local_5.width) - _tickMark.width) - 7);
            _Str_2194 = new this._Str_1461();
            _nameChangeDialog.addChild(_Str_2194);
            _Str_2194.x = _tickMark.x;
            _Str_2194.y = _tickMark.y;
            _Str_2183 = false;
            _Str_1263 = new WaitIndicator(_style);
            _nameChangeDialog.addChild(_Str_1263);
            _Str_1263.y = ((_local_5.y + int((_local_5.height / 2))) + 2);
            _Str_1263.x = (((_local_5.x + _local_5.width) - int((_tickMark.width / 2))) - 7);
            _Str_1263.visible = false;
            _local_5.addEventListener(MouseEvent.CLICK, _Str_2173);
            _nameChangeDialog.y = -50;
        }
    }
}
