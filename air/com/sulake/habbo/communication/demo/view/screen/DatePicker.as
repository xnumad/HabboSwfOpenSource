//com.sulake.habbo.communication.demo.view.screen.DatePicker

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.LayoutGroup;
    import feathers.controls.PickerList;

    public class DatePicker extends LayoutGroup {

        private var _dayPicker:PickerList;
        private var _monthPicker:PickerList;
        private var _yearPicker:PickerList;

        public function DatePicker();

        private function createView():void;

        private function updateDatePicker(k:Date):void;

        public function get isDateValid():Boolean;

        public function get day():int;

        public function get month():int;

        public function get year():int;

        public function reset():void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

