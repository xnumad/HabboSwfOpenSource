//com.sulake.habbo.communication.demo.view.DesktopLoginView

package com.sulake.habbo.communication.demo.view{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.communication.demo.HabboCommunicationDemo;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IDropListWindow;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;

    [SecureSWF(rename="true")]
    public class DesktopLoginView extends EventDispatcherWrapper implements ILoginView {

        private var _controller:HabboCommunicationDemo;
        private var _dialog:IModalDialog;
        private var _window:IWindowContainer;
        private var _environmentList:IDropListWindow;
        private var _defaultPropertyValues:Dictionary;
        private var _userListItem:IWindow;
        private var _environmentItem:IWindow;
        private var _firstTryUsingExistingSession:Boolean;
        private var _testEnvironmentIndex:int;

        public function DesktopLoginView(k:HabboCommunicationDemo);

        override public function dispose():void;

        public function closeView():void;

        public function get useSSOTicket():Boolean;

        public function get useExistingSession():Boolean;

        private function createWindow():void;

        public function getModalXmlWindow(k:String, _arg_2:String="_xml"):IModalDialog;

        private function testEnvironmentAvailable(k:Boolean):void;

        private function getEnvironmentNames(k:Array):Array;

        private function dropMenuEventHandler(k:WindowEvent):void;

        public function populateCharacterList(k:Dictionary):void;

        private function handleKeyUp(k:WindowKeyboardEvent):void;

        private function windowEventProcessor(k:WindowEvent=null):void;

        private function listEventHandler(k:WindowEvent, _arg_2:IWindow):void;

        public function showDisconnected(k:int, _arg_2:String):void;

        public function showInvalidLoginError():void;


    }
}//package com.sulake.habbo.communication.demo.view

