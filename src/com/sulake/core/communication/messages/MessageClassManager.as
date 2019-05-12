package com.sulake.core.communication.messages
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.ClassUtils;
    import flash.utils.getQualifiedClassName;

    public class MessageClassManager 
    {
        private var _messageIdByComposerClass:Dictionary;
        private var _messageIdByEventClass:Dictionary;
        private var _messageInstancesById:Dictionary;

        public function MessageClassManager()
        {
            this._messageIdByComposerClass = new Dictionary();
            this._messageIdByEventClass = new Dictionary();
            this._messageInstancesById = new Dictionary();
            super();
        }

        public function dispose():void
        {
            if (this._messageInstancesById)
            {
                for each (var key:Object in this._messageInstancesById)
                {
					var messageEvent:IMessageEvent = this._messageInstancesById[key];
                    if (messageEvent)
                    {
                        messageEvent.dispose();
                    }
                }
            }
        }

        public function registerMessages(messageConfiguration:IMessageConfiguration):void
        {
            for (var name:String in messageConfiguration.events)
            {
                this.registerMessageEventClass(parseInt(name), messageConfiguration.events[name]);
            }
            for (name in messageConfiguration.composers)
            {
                this.registerMessageComposerClass(parseInt(name), messageConfiguration.composers[name]);
            }
        }

        private function registerMessageComposerClass(messageID:int, composerClass:Class):void
        {
            if (!ClassUtils.implementsInterface(composerClass, IMessageComposer))
            {
                throw (new Error(("Invalid composer class for message ID " + messageID)));
            }
            var _local_3:String = getQualifiedClassName(composerClass);
            if (this._messageIdByComposerClass[_local_3] != null)
            {
                throw (new Error(("Duplicate message ID definition for composer class " + _local_3)));
            }
            this._messageIdByComposerClass[_local_3] = messageID;
        }

        private function registerMessageEventClass(messageId:int, eventClass:Class):void
        {
            if (!ClassUtils.implementsInterface(eventClass, IMessageEvent))
            {
                throw (new Error(("Invalid event class for message ID " + messageId)));
            }
            var className:String = getQualifiedClassName(eventClass);
            if (this._messageIdByEventClass[className] != null)
            {
                throw (new Error(("Duplicate message ID definition for event class " + className)));
            }
            this._messageIdByEventClass[className] = messageId;
        }

        public function registerMessageEvent(event:IMessageEvent):void
        {
            var className:String = getQualifiedClassName(event);
            var messageEvent:Object = this._messageIdByEventClass[className];
            if (messageEvent == null)
            {
                throw (new Error(("Unknown message event class " + className)));
            }
            var parser:Array = this._messageInstancesById[messageEvent];
            if (parser != null)
            {
                event.parser = (parser[0] as IMessageEvent).parser;
            }
            else
            {
                parser = new Array();
                this._messageInstancesById[messageEvent] = parser;
                event.parser = new event.parserClass();
            }
            parser.push(event);
        }

        public function unregisterMessageEvent(event:IMessageEvent):void
        {
            var className:String = getQualifiedClassName(event);
            var eventClass:Object = this._messageIdByEventClass[className];
            if (eventClass == null)
            {
                return;
            }
            var instances:Array = this._messageInstancesById[eventClass];
            if (instances == null)
            {
                return;
            }
            var index:int = instances.indexOf(event);
            if (index >= 0)
            {
                instances.splice(index, 1);
                if (instances.length == 0)
                {
                    delete this._messageInstancesById[eventClass];
                }
            }
        }

        public function getMessageIDForComposer(composer:IMessageComposer):int
        {
            var composerClass:Object = this._messageIdByComposerClass[getQualifiedClassName(composer)];
            if (composerClass == null)
            {
				Habbo.trackLoginStep("No out going packet found for: " + getQualifiedClassName(composer));
                return -1;
            }
            return int(composerClass);
        }

        public function getMessageEventsForID(id:int):Array
        {
            return this._messageInstancesById[id];
        }
    }
}
