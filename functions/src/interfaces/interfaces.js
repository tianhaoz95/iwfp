/*eslint-disable block-scoped-var, id-length, no-control-regex, no-magic-numbers, no-prototype-builtins, no-redeclare, no-shadow, no-var, sort-vars*/
"use strict";

var $protobuf = require("protobufjs/minimal");

// Common aliases
var $Reader = $protobuf.Reader, $Writer = $protobuf.Writer, $util = $protobuf.util;

// Exported root namespace
var $root = $protobuf.roots["default"] || ($protobuf.roots["default"] = {});

$root.ProtoCreditCard = (function() {

    /**
     * Properties of a ProtoCreditCard.
     * @exports IProtoCreditCard
     * @interface IProtoCreditCard
     * @property {string|null} [id] ProtoCreditCard id
     * @property {string|null} [displayName] ProtoCreditCard displayName
     * @property {Array.<IProtoPromotion>|null} [promotions] ProtoCreditCard promotions
     */

    /**
     * Constructs a new ProtoCreditCard.
     * @exports ProtoCreditCard
     * @classdesc Represents a ProtoCreditCard.
     * @implements IProtoCreditCard
     * @constructor
     * @param {IProtoCreditCard=} [properties] Properties to set
     */
    function ProtoCreditCard(properties) {
        this.promotions = [];
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * ProtoCreditCard id.
     * @member {string} id
     * @memberof ProtoCreditCard
     * @instance
     */
    ProtoCreditCard.prototype.id = "";

    /**
     * ProtoCreditCard displayName.
     * @member {string} displayName
     * @memberof ProtoCreditCard
     * @instance
     */
    ProtoCreditCard.prototype.displayName = "";

    /**
     * ProtoCreditCard promotions.
     * @member {Array.<IProtoPromotion>} promotions
     * @memberof ProtoCreditCard
     * @instance
     */
    ProtoCreditCard.prototype.promotions = $util.emptyArray;

    /**
     * Creates a new ProtoCreditCard instance using the specified properties.
     * @function create
     * @memberof ProtoCreditCard
     * @static
     * @param {IProtoCreditCard=} [properties] Properties to set
     * @returns {ProtoCreditCard} ProtoCreditCard instance
     */
    ProtoCreditCard.create = function create(properties) {
        return new ProtoCreditCard(properties);
    };

    /**
     * Encodes the specified ProtoCreditCard message. Does not implicitly {@link ProtoCreditCard.verify|verify} messages.
     * @function encode
     * @memberof ProtoCreditCard
     * @static
     * @param {IProtoCreditCard} message ProtoCreditCard message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ProtoCreditCard.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && message.hasOwnProperty("id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        if (message.promotions != null && message.promotions.length)
            for (var i = 0; i < message.promotions.length; ++i)
                $root.ProtoPromotion.encode(message.promotions[i], writer.uint32(/* id 3, wireType 2 =*/26).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified ProtoCreditCard message, length delimited. Does not implicitly {@link ProtoCreditCard.verify|verify} messages.
     * @function encodeDelimited
     * @memberof ProtoCreditCard
     * @static
     * @param {IProtoCreditCard} message ProtoCreditCard message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ProtoCreditCard.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a ProtoCreditCard message from the specified reader or buffer.
     * @function decode
     * @memberof ProtoCreditCard
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {ProtoCreditCard} ProtoCreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ProtoCreditCard.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.ProtoCreditCard();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.id = reader.string();
                break;
            case 2:
                message.displayName = reader.string();
                break;
            case 3:
                if (!(message.promotions && message.promotions.length))
                    message.promotions = [];
                message.promotions.push($root.ProtoPromotion.decode(reader, reader.uint32()));
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a ProtoCreditCard message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof ProtoCreditCard
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {ProtoCreditCard} ProtoCreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ProtoCreditCard.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a ProtoCreditCard message.
     * @function verify
     * @memberof ProtoCreditCard
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    ProtoCreditCard.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.id != null && message.hasOwnProperty("id"))
            if (!$util.isString(message.id))
                return "id: string expected";
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            if (!$util.isString(message.displayName))
                return "displayName: string expected";
        if (message.promotions != null && message.hasOwnProperty("promotions")) {
            if (!Array.isArray(message.promotions))
                return "promotions: array expected";
            for (var i = 0; i < message.promotions.length; ++i) {
                var error = $root.ProtoPromotion.verify(message.promotions[i]);
                if (error)
                    return "promotions." + error;
            }
        }
        return null;
    };

    /**
     * Creates a ProtoCreditCard message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof ProtoCreditCard
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {ProtoCreditCard} ProtoCreditCard
     */
    ProtoCreditCard.fromObject = function fromObject(object) {
        if (object instanceof $root.ProtoCreditCard)
            return object;
        var message = new $root.ProtoCreditCard();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        if (object.promotions) {
            if (!Array.isArray(object.promotions))
                throw TypeError(".ProtoCreditCard.promotions: array expected");
            message.promotions = [];
            for (var i = 0; i < object.promotions.length; ++i) {
                if (typeof object.promotions[i] !== "object")
                    throw TypeError(".ProtoCreditCard.promotions: object expected");
                message.promotions[i] = $root.ProtoPromotion.fromObject(object.promotions[i]);
            }
        }
        return message;
    };

    /**
     * Creates a plain object from a ProtoCreditCard message. Also converts values to other types if specified.
     * @function toObject
     * @memberof ProtoCreditCard
     * @static
     * @param {ProtoCreditCard} message ProtoCreditCard
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    ProtoCreditCard.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.arrays || options.defaults)
            object.promotions = [];
        if (options.defaults) {
            object.id = "";
            object.displayName = "";
        }
        if (message.id != null && message.hasOwnProperty("id"))
            object.id = message.id;
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            object.displayName = message.displayName;
        if (message.promotions && message.promotions.length) {
            object.promotions = [];
            for (var j = 0; j < message.promotions.length; ++j)
                object.promotions[j] = $root.ProtoPromotion.toObject(message.promotions[j], options);
        }
        return object;
    };

    /**
     * Converts this ProtoCreditCard to JSON.
     * @function toJSON
     * @memberof ProtoCreditCard
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    ProtoCreditCard.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return ProtoCreditCard;
})();

$root.ProtoPromotion = (function() {

    /**
     * Properties of a ProtoPromotion.
     * @exports IProtoPromotion
     * @interface IProtoPromotion
     * @property {string|null} [id] ProtoPromotion id
     * @property {string|null} [displayName] ProtoPromotion displayName
     * @property {IProtoShoppingCategory|null} [category] ProtoPromotion category
     */

    /**
     * Constructs a new ProtoPromotion.
     * @exports ProtoPromotion
     * @classdesc Represents a ProtoPromotion.
     * @implements IProtoPromotion
     * @constructor
     * @param {IProtoPromotion=} [properties] Properties to set
     */
    function ProtoPromotion(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * ProtoPromotion id.
     * @member {string} id
     * @memberof ProtoPromotion
     * @instance
     */
    ProtoPromotion.prototype.id = "";

    /**
     * ProtoPromotion displayName.
     * @member {string} displayName
     * @memberof ProtoPromotion
     * @instance
     */
    ProtoPromotion.prototype.displayName = "";

    /**
     * ProtoPromotion category.
     * @member {IProtoShoppingCategory|null|undefined} category
     * @memberof ProtoPromotion
     * @instance
     */
    ProtoPromotion.prototype.category = null;

    /**
     * Creates a new ProtoPromotion instance using the specified properties.
     * @function create
     * @memberof ProtoPromotion
     * @static
     * @param {IProtoPromotion=} [properties] Properties to set
     * @returns {ProtoPromotion} ProtoPromotion instance
     */
    ProtoPromotion.create = function create(properties) {
        return new ProtoPromotion(properties);
    };

    /**
     * Encodes the specified ProtoPromotion message. Does not implicitly {@link ProtoPromotion.verify|verify} messages.
     * @function encode
     * @memberof ProtoPromotion
     * @static
     * @param {IProtoPromotion} message ProtoPromotion message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ProtoPromotion.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && message.hasOwnProperty("id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        if (message.category != null && message.hasOwnProperty("category"))
            $root.ProtoShoppingCategory.encode(message.category, writer.uint32(/* id 3, wireType 2 =*/26).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified ProtoPromotion message, length delimited. Does not implicitly {@link ProtoPromotion.verify|verify} messages.
     * @function encodeDelimited
     * @memberof ProtoPromotion
     * @static
     * @param {IProtoPromotion} message ProtoPromotion message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ProtoPromotion.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a ProtoPromotion message from the specified reader or buffer.
     * @function decode
     * @memberof ProtoPromotion
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {ProtoPromotion} ProtoPromotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ProtoPromotion.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.ProtoPromotion();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.id = reader.string();
                break;
            case 2:
                message.displayName = reader.string();
                break;
            case 3:
                message.category = $root.ProtoShoppingCategory.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a ProtoPromotion message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof ProtoPromotion
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {ProtoPromotion} ProtoPromotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ProtoPromotion.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a ProtoPromotion message.
     * @function verify
     * @memberof ProtoPromotion
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    ProtoPromotion.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.id != null && message.hasOwnProperty("id"))
            if (!$util.isString(message.id))
                return "id: string expected";
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            if (!$util.isString(message.displayName))
                return "displayName: string expected";
        if (message.category != null && message.hasOwnProperty("category")) {
            var error = $root.ProtoShoppingCategory.verify(message.category);
            if (error)
                return "category." + error;
        }
        return null;
    };

    /**
     * Creates a ProtoPromotion message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof ProtoPromotion
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {ProtoPromotion} ProtoPromotion
     */
    ProtoPromotion.fromObject = function fromObject(object) {
        if (object instanceof $root.ProtoPromotion)
            return object;
        var message = new $root.ProtoPromotion();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        if (object.category != null) {
            if (typeof object.category !== "object")
                throw TypeError(".ProtoPromotion.category: object expected");
            message.category = $root.ProtoShoppingCategory.fromObject(object.category);
        }
        return message;
    };

    /**
     * Creates a plain object from a ProtoPromotion message. Also converts values to other types if specified.
     * @function toObject
     * @memberof ProtoPromotion
     * @static
     * @param {ProtoPromotion} message ProtoPromotion
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    ProtoPromotion.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.id = "";
            object.displayName = "";
            object.category = null;
        }
        if (message.id != null && message.hasOwnProperty("id"))
            object.id = message.id;
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            object.displayName = message.displayName;
        if (message.category != null && message.hasOwnProperty("category"))
            object.category = $root.ProtoShoppingCategory.toObject(message.category, options);
        return object;
    };

    /**
     * Converts this ProtoPromotion to JSON.
     * @function toJSON
     * @memberof ProtoPromotion
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    ProtoPromotion.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return ProtoPromotion;
})();

$root.ProtoShoppingCategory = (function() {

    /**
     * Properties of a ProtoShoppingCategory.
     * @exports IProtoShoppingCategory
     * @interface IProtoShoppingCategory
     * @property {string|null} [id] ProtoShoppingCategory id
     * @property {string|null} [displayName] ProtoShoppingCategory displayName
     */

    /**
     * Constructs a new ProtoShoppingCategory.
     * @exports ProtoShoppingCategory
     * @classdesc Represents a ProtoShoppingCategory.
     * @implements IProtoShoppingCategory
     * @constructor
     * @param {IProtoShoppingCategory=} [properties] Properties to set
     */
    function ProtoShoppingCategory(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * ProtoShoppingCategory id.
     * @member {string} id
     * @memberof ProtoShoppingCategory
     * @instance
     */
    ProtoShoppingCategory.prototype.id = "";

    /**
     * ProtoShoppingCategory displayName.
     * @member {string} displayName
     * @memberof ProtoShoppingCategory
     * @instance
     */
    ProtoShoppingCategory.prototype.displayName = "";

    /**
     * Creates a new ProtoShoppingCategory instance using the specified properties.
     * @function create
     * @memberof ProtoShoppingCategory
     * @static
     * @param {IProtoShoppingCategory=} [properties] Properties to set
     * @returns {ProtoShoppingCategory} ProtoShoppingCategory instance
     */
    ProtoShoppingCategory.create = function create(properties) {
        return new ProtoShoppingCategory(properties);
    };

    /**
     * Encodes the specified ProtoShoppingCategory message. Does not implicitly {@link ProtoShoppingCategory.verify|verify} messages.
     * @function encode
     * @memberof ProtoShoppingCategory
     * @static
     * @param {IProtoShoppingCategory} message ProtoShoppingCategory message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ProtoShoppingCategory.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && message.hasOwnProperty("id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        return writer;
    };

    /**
     * Encodes the specified ProtoShoppingCategory message, length delimited. Does not implicitly {@link ProtoShoppingCategory.verify|verify} messages.
     * @function encodeDelimited
     * @memberof ProtoShoppingCategory
     * @static
     * @param {IProtoShoppingCategory} message ProtoShoppingCategory message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ProtoShoppingCategory.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a ProtoShoppingCategory message from the specified reader or buffer.
     * @function decode
     * @memberof ProtoShoppingCategory
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {ProtoShoppingCategory} ProtoShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ProtoShoppingCategory.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.ProtoShoppingCategory();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.id = reader.string();
                break;
            case 2:
                message.displayName = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a ProtoShoppingCategory message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof ProtoShoppingCategory
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {ProtoShoppingCategory} ProtoShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ProtoShoppingCategory.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a ProtoShoppingCategory message.
     * @function verify
     * @memberof ProtoShoppingCategory
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    ProtoShoppingCategory.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.id != null && message.hasOwnProperty("id"))
            if (!$util.isString(message.id))
                return "id: string expected";
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            if (!$util.isString(message.displayName))
                return "displayName: string expected";
        return null;
    };

    /**
     * Creates a ProtoShoppingCategory message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof ProtoShoppingCategory
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {ProtoShoppingCategory} ProtoShoppingCategory
     */
    ProtoShoppingCategory.fromObject = function fromObject(object) {
        if (object instanceof $root.ProtoShoppingCategory)
            return object;
        var message = new $root.ProtoShoppingCategory();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        return message;
    };

    /**
     * Creates a plain object from a ProtoShoppingCategory message. Also converts values to other types if specified.
     * @function toObject
     * @memberof ProtoShoppingCategory
     * @static
     * @param {ProtoShoppingCategory} message ProtoShoppingCategory
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    ProtoShoppingCategory.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.id = "";
            object.displayName = "";
        }
        if (message.id != null && message.hasOwnProperty("id"))
            object.id = message.id;
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            object.displayName = message.displayName;
        return object;
    };

    /**
     * Converts this ProtoShoppingCategory to JSON.
     * @function toJSON
     * @memberof ProtoShoppingCategory
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    ProtoShoppingCategory.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return ProtoShoppingCategory;
})();

module.exports = $root;
