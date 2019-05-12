package onBoardingHcUi
{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.text.TextField;
    import flash.display.BitmapData;
    import flash.events.MouseEvent;
    import onBoardingHcUi.images.*;

    public class _Str_862 extends Sprite 
    {
        private var _Str_1793:Class;
        private var _Str_1471:Class;
        private var _Str_1421:Class;
        private var _Str_1842:Class;
        private var _Str_622:String;
        private var _group:RadioButtonGroup;
        private var _Str_1616:Bitmap;
        private var _Str_848:TextField;
        private var _selected:Boolean;
        private var _Str_1150:BitmapData;
        private var _Str_1190:BitmapData;
        private var _Str_1111:uint;
        private var _Str_616:int;

        public function _Str_862(k:String, _arg_2:RadioButtonGroup, _arg_3:int=1, _arg_4:BitmapData=null, _arg_5:BitmapData=null, _arg_6:uint=0)
        {
            this._Str_1793 = _Str_981;
            this._Str_1471 = _Str_1003;
            this._Str_1421 = _Str_847;
            this._Str_1842 = _Str_640;
            super();
            this._Str_622 = k;
            this._group = _arg_2;
            this._Str_616 = _arg_3;
            mouseChildren = false;
            buttonMode = true;
            this._Str_1111 = _arg_6;
            var _local_7:* = (_arg_3 == LoaderUI._Str_1585);
            this._Str_848 = LoaderUI._Str_1132(this._Str_622, 20, ((_arg_3 == LoaderUI._Str_1585) ? 15201722 : 0), true, false, false, _local_7);
            this._Str_848.alpha = ((_arg_3 == LoaderUI._Str_1585) ? 0.7 : 1);
            if (_arg_3 == LoaderUI._Str_2056)
            {
                LoaderUI._Str_1516(this._Str_848);
            }
            switch (_arg_3)
            {
                case LoaderUI._Str_1585:
                    this._Str_1150 = ((_arg_4 != null) ? _arg_4 : Bitmap(new this._Str_1842()).bitmapData);
                    this._Str_1190 = ((_arg_5 != null) ? _arg_5 : Bitmap(new this._Str_1421()).bitmapData);
                    break;
                case LoaderUI._Str_2056:
                    this._Str_1150 = ((_arg_4 != null) ? _arg_4 : Bitmap(new this._Str_1471()).bitmapData);
                    this._Str_1190 = ((_arg_5 != null) ? _arg_5 : Bitmap(new this._Str_1793()).bitmapData);
                    break;
            }
            this._Str_1616 = new Bitmap(this._Str_1190);
            addChild(this._Str_1616);
            this._Str_1616.y = int(((this._Str_848.height - this._Str_1616.height) / 2));
            this._Str_1616.alpha = ((_arg_3 == LoaderUI._Str_1585) ? 0.8 : 1);
            addChild(this._Str_848);
            this._Str_848.x = (this._Str_1616.width + 6);
            if (((!(this._group == null)) && (this._group.buttons.indexOf(this) < 0)))
            {
                this._group.buttons.push(this);
            }
            addEventListener(MouseEvent.MOUSE_DOWN, this._Str_780);
        }

        private function _Str_780(k:MouseEvent):void
        {
            addEventListener(MouseEvent.MOUSE_UP, this._Str_712);
        }

        private function _Str_712(k:MouseEvent):void
        {
            k.stopImmediatePropagation();
            removeEventListener(MouseEvent.MOUSE_UP, this._Str_712);
            this.selected = true;
        }

        public function get group():RadioButtonGroup
        {
            return this._group;
        }

        public function set group(k:RadioButtonGroup):void
        {
            if (this._group == k)
            {
                return;
            }
            if (((!(this._group == null)) && (this._group.buttons.indexOf(this) >= 0)))
            {
                this._group.buttons.splice(this._group.buttons.indexOf(this), 1);
            }
            this._group = k;
            this.selected = false;
        }

        public function _Str_1906(k:uint):void
        {
            this._Str_1111 = k;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }

        public function set selected(k:Boolean):void
        {
            var _local_2:_Str_862;
            if (this._selected == k)
            {
                return;
            }
            this._selected = k;
            if (((this._selected) && (!(this._group == null))))
            {
                for each (_local_2 in this._group.buttons)
                {
                    if (_local_2 != this)
                    {
                        _local_2.selected = false;
                        if (this._Str_1111)
                        {
                            _local_2._Str_848.textColor = this._Str_1111;
                            _local_2._Str_848.alpha = 0.6;
                        }
                    }
                    else
                    {
                        _local_2._Str_848.textColor = ((this._Str_616 == LoaderUI._Str_1585) ? 15201722 : 0);
                        _local_2._Str_848.alpha = 0.7;
                    }
                }
                this._group._Str_1781();
            }
            this._Str_1616.bitmapData = ((this._selected) ? this._Str_1150 : this._Str_1190);
        }
    }
}
