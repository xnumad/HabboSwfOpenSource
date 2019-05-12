package onBoardingHcUi
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class RadioButtonGroup 
    {
        private var _selectedAction:Function;
        public var buttons:Vector.<_Str_862>;

        public function RadioButtonGroup(k:Function):void
        {
            this.buttons = new Vector.<_Str_862>(0);
            super();
            this._selectedAction = k;
        }

        public function get selected():_Str_862
        {
            var k:_Str_862;
            for each (k in this.buttons)
            {
                if (k.selected)
                {
                    return k;
                }
            }
            return null;
        }

        public function _Str_1781():void
        {
            this._selectedAction();
        }
    }
}
