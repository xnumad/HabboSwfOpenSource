package com.sulake.core.runtime
{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.core.runtime.exceptions.InvalidComponentException;
    import flash.utils.getQualifiedClassName;
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.exceptions.ComponentDisposedException;
    import flash.events.Event;
    import com.sulake.core.runtime.events.UnknownEvent;
    import flash.utils.Dictionary;
    import __AS3__.vec.*;
    import com.sulake.core.runtime.exceptions.*;

    public class Component implements IUnknown, IHabboConfigurationManager 
    {
        public static const COMPONENT_EVENT_RUNNING:String = "COMPONENT_EVENT_RUNNING";
        public static const COMPONENT_EVENT_DISPOSING:String = "COMPONENT_EVENT_DISPOSING";
        public static const COMPONENT_EVENT_WARNING:String = "COMPONENT_EVENT_WARNING";
        public static const COMPONENT_EVENT_ERROR:String = "COMPONENT_EVENT_ERROR";
        public static const COMPONENT_EVENT_DEBUG:String = "COMPONENT_EVENT_DEBUG";
        public static const COMPONENT_EVENT_UNLOCKED:String = "COMPONENT_EVENT_UNLOCKED";
        protected static const INTERNAL_EVENT_UNLOCKED:String = "_INTERNAL_EVENT_UNLOCKED";
        public static const COMPONENT_FLAG_NULL:uint = 0;
        public static const COMPONENT_FLAG_DISPOSABLE:uint = 1;
        public static const COMPONENT_FLAG_CONTEXT:uint = 2;
        public static const COMPONENT_FLAG_INTERFACE:uint = 4;

        protected var _references:uint = 0;
        protected var _lastError:String = "";
        protected var _lastDebug:String = "";
        protected var _lastWarning:String = "";
        private var _assets:IAssetLibrary;
        private var _events:EventDispatcherWrapper;
        private var _flags:uint;
        private var _iids:InterfaceStructList;
        private var _context:IContext = null;
        private var _disposed:Boolean = false;
        private var _locked:Boolean = false;
        private var _requiredDependencyCount:int = 1;
        private var _requiredDependencyIids:Vector.<String>;
        private var _dependencyDisposalActions:Vector.<Function>;

        public function Component(k:IContext, _arg_2:uint=0, assets:IAssetLibrary=null)
        {
            var dependency:ComponentDependency;
            this._dependencyDisposalActions = new Vector.<Function>(0);
            super();
            this._flags = _arg_2;
            this._iids = new InterfaceStructList();
            this._events = new EventDispatcherWrapper();
            this._context = k;
            this._assets = ((assets != null) ? assets : new AssetLibrary("_internal_asset_library"));
            if (this._context == null)
            {
                throw (new InvalidComponentException("IContext not provided to Component's constructor!"));
            }
            if (this.dependencies.length > 0)
            {
                this.lock();
            }
            this._requiredDependencyIids = new Vector.<String>(0);
            for each (dependency in this.dependencies)
            {
                if (dependency.isRequired)
                {
                    this._requiredDependencyIids.push(getQualifiedClassName(dependency.identifier));
                }
                this.injectDependency(dependency.identifier, dependency.dependencySetter, dependency.isRequired, dependency.eventListeners);
            }
            this.allDependenciesRequested();
        }

        public static function requiredDependencyIids(component:Component):InterfaceStructList
        {
            return component._iids;
        }


        public function get locked():Boolean
        {
            return this._locked;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get context():IContext
        {
            return this._context;
        }

        public function get events():IEventDispatcher
        {
            return this._events;
        }

        public function get assets():IAssetLibrary
        {
            return this._assets;
        }

        private function injectDependency(identifier:IID, dependencySetter:Function, isRequired:Boolean, eventListeners:Array):void
        {
            if (isRequired)
            {
                this._requiredDependencyCount++;
            }
            this.queueInterface(identifier, function (setter:Function, required:Boolean, listeners:Array, componentName:String):Function
            {
                return (function (identifier:IID, unknown:IUnknown):void
                {
                    var eventDispatcher:* = undefined;
                    var listener:* = undefined;
                    if (disposed)
                    {
                        return;
                    }
                    Logger.log(((("Injecting " + identifier) + " into ") + componentName));
                    if (setter != null)
                    {
                        setter(unknown);
                    }
                    if (listeners != null)
                    {
                        eventDispatcher = Component(unknown).events;
                        for each (listener in listeners)
                        {
                            Logger.log(("Adding event listener for " + listener.type));
                            eventDispatcher.addEventListener(listener.type, listener.callback);
                        }
                    }
                    _dependencyDisposalActions.push(function (iid:IID, component:IUnknown):Function
                    {
                        return (function ():void
                        {
                            var k:*;
                            var _local_2:*;
                            Logger.log(((("Releasing " + identifier) + " from ") + componentName));
                            if (listeners != null)
                            {
                                k = Component(component).events;
                                if (k != null)
                                {
                                    for each (_local_2 in listeners)
                                    {
                                        Logger.log(("Removing event listener for " + _local_2.type));
                                        k.removeEventListener(_local_2.type, _local_2.callback);
                                    }
                                }
                            }
                            if (setter != null)
                            {
                                setter(null);
                            }
                            component.release(iid);
                        });
                    }(identifier, unknown));
                    if (required)
                    {
                        allDependenciesRequested(getQualifiedClassName(identifier));
                    }
                });
            }(dependencySetter, isRequired, eventListeners, getQualifiedClassName(this)));
        }

        private function allDependenciesRequested(k:String=""):void
        {
            this._requiredDependencyCount--;
            if (((!(k == "")) && (this._requiredDependencyIids.indexOf(k) > -1)))
            {
                this._requiredDependencyIids.splice(this._requiredDependencyIids.indexOf(k), 1);
            }
            if (this._requiredDependencyCount == 0)
            {
                this.initComponent();
                this.unlock();
            }
        }

        protected function get allRequiredDependenciesInjected():Boolean
        {
            return this._requiredDependencyCount == 0;
        }

        protected function get dependencies():Vector.<ComponentDependency>
        {
            return new Vector.<ComponentDependency>(0);
        }

        protected function initComponent():void
        {
        }

        public function queueInterface(k:IID, _arg_2:Function=null):IUnknown
        {
            var _local_3:InterfaceStruct = this._iids.getStructByInterface(k);
            if (_local_3 == null)
            {
                return this._context.queueInterface(k, _arg_2);
            }
            if (this._disposed)
            {
                throw (new ComponentDisposedException((('Failed to queue interface trough disposed Component "' + getQualifiedClassName(this)) + '"!')));
            }
            if (this._locked)
            {
                return null;
            }
            _local_3.reserve();
            var _local_4:IUnknown = (_local_3.unknown as IUnknown);
            if (_arg_2 != null)
            {
                (_arg_2(k, _local_4));
            }
            return _local_4;
        }

        public function release(k:IID):uint
        {
            if (this._disposed)
            {
                return 0;
            }
            var _local_2:InterfaceStruct = this._iids.getStructByInterface(k);
            if (_local_2 == null)
            {
                this._lastError = (("Attempting to release unknown interface:" + k) + "!");
                throw (new Error(this._lastError));
            }
            var _local_3:uint = _local_2.release();
            if ((this._flags & COMPONENT_FLAG_INTERFACE))
            {
                if (_local_3 == 0)
                {
                    if (this._iids.getTotalReferenceCount() == 0)
                    {
                        this._context.detachComponent(this);
                        this.dispose();
                    }
                }
            }
            return _local_3;
        }

        public function dispose():void
        {
            var k:Function;
            if (!this._disposed)
            {
                for each (k in this._dependencyDisposalActions)
                {
                    (k());
                }
                this._dependencyDisposalActions = null;
                this._events.dispatchEvent(new Event(Component.COMPONENT_EVENT_DISPOSING));
                this._events = null;
                this._iids.dispose();
                this._iids = null;
                this._assets.dispose();
                this._assets = null;
                this._context = null;
                this._references = 0;
                this._disposed = true;
            }
        }

        public function purge():void
        {
        }

        final protected function lock():void
        {
            if (!this._locked)
            {
                this._locked = true;
            }
        }

        final protected function unlock():void
        {
            if (this._locked)
            {
                this._locked = false;
                this._events.dispatchEvent(new UnknownEvent(INTERNAL_EVENT_UNLOCKED, this));
            }
        }

        public function toString():String
        {
            return ((("[component " + getQualifiedClassName(this)) + " refs: ") + this._references) + "]";
        }

        public function toXMLString(k:uint=0):String
        {
            var _local_6:InterfaceStruct;
            var _local_2:String = "";
            var _local_3:uint;
            while (_local_3 < k)
            {
                _local_2 = (_local_2 + "\t");
                _local_3++;
            }
            var _local_4:String = getQualifiedClassName(this);
            var _local_5:String = "";
            _local_5 = (_local_5 + (((_local_2 + '<component class="') + _local_4) + '">\n'));
            var _local_7:uint = this._iids.length;
            var _local_8:uint;
            while (_local_8 < _local_7)
            {
                _local_6 = this._iids.getStructByIndex(_local_8);
                _local_5 = (_local_5 + (((((_local_2 + '\t<interface iid="') + _local_6.iis) + '" refs="') + _local_6.references) + '"/>\n'));
                _local_8++;
            }
            _local_5 = (_local_5 + (_local_2 + "</component>\n"));
            return _local_5;
        }

        public function registerUpdateReceiver(k:IUpdateReceiver, _arg_2:uint):void
        {
            if (!this._disposed)
            {
                this._context.registerUpdateReceiver(k, _arg_2);
            }
        }

        public function removeUpdateReceiver(k:IUpdateReceiver):void
        {
            if (!this._disposed)
            {
                this._context.removeUpdateReceiver(k);
            }
        }

        public function get flags():uint
        {
            return this._flags;
        }

        public function propertyExists(k:String):Boolean
        {
            return (this._context.configuration) ? this._context.configuration.propertyExists(k) : false;
        }

        public function getProperty(k:String, _arg_2:Dictionary=null):String
        {
            return (this._context.configuration) ? this._context.configuration.getProperty(k, _arg_2) : "";
        }

        public function setProperty(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void
        {
            if (this._context.configuration)
            {
                this._context.configuration.setProperty(k, _arg_2, _arg_3, _arg_4);
            }
        }

        public function getBoolean(k:String):Boolean
        {
            return (this._context.configuration) ? this._context.configuration.getBoolean(k) : false;
        }

        public function getInteger(k:String, _arg_2:int):int
        {
            return (this._context.configuration) ? this._context.configuration.getInteger(k, _arg_2) : 0;
        }

        public function interpolate(k:String):String
        {
            return (this._context.configuration) ? this._context.configuration.interpolate(k) : "";
        }

        public function updateUrlProtocol(k:String):String
        {
            return (this._context.configuration) ? this._context.configuration.updateUrlProtocol(k) : "";
        }
    }
}
