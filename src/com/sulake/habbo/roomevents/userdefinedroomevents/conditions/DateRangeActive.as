package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindowContainer;
    import flash.globalization.DateTimeFormatter;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;

    public class DateRangeActive extends WiredCondition 
    {


        private static function getDate(k:IWindowContainer, _arg_2:String):Number
        {
            return Date.parse(ITextFieldWindow(k.findChildByName(_arg_2)).text);
        }


        override public function get code():int
        {
            return ConditionCodes.DATE_RANGE_ACTIVE;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_4:Number;
            var _local_2:Array = [];
            var _local_3:Number = getDate(k, "start_date");
            if (!isNaN(_local_3))
            {
                _local_2.push(int((_local_3 / 1000)));
                _local_4 = getDate(k, "end_date");
                if (!isNaN(_local_4))
                {
                    _local_2.push(int((_local_4 / 1000)));
                }
            }
            return _local_2;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            var _local_4:Date;
            var _local_5:Date;
            var _local_3:DateTimeFormatter = new DateTimeFormatter("en-US");
            _local_3.setDateTimePattern("yyyy/MM/dd HH:mm");
            if (_arg_2.intData.length > 0)
            {
                _local_4 = new Date((_arg_2.intData[0] * 1000));
                ITextFieldWindow(k.findChildByName("start_date")).text = _local_3.format(_local_4);
            }
            else
            {
                ITextFieldWindow(k.findChildByName("start_date")).text = "";
            }
            if (_arg_2.intData.length > 1)
            {
                _local_5 = new Date((_arg_2.intData[1] * 1000));
                ITextFieldWindow(k.findChildByName("end_date")).text = _local_3.format(_local_5);
            }
            else
            {
                ITextFieldWindow(k.findChildByName("end_date")).text = "";
            }
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }
    }
}
