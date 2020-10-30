/*eslint-disable block-scoped-var, id-length, no-control-regex, no-magic-numbers, no-prototype-builtins, no-redeclare, no-shadow, no-var, sort-vars*/
"use strict";

var $protobuf = require("protobufjs/minimal");

// Common aliases
var $Reader = $protobuf.Reader, $Writer = $protobuf.Writer, $util = $protobuf.util;

// Exported root namespace
var $root = $protobuf.roots["default"] || ($protobuf.roots["default"] = {});

$root.CreditCard = (function() {

    /**
     * Properties of a CreditCard.
     * @exports ICreditCard
     * @interface ICreditCard
     * @property {string|null} [id] CreditCard id
     * @property {string|null} [displayName] CreditCard displayName
     * @property {Array.<IPromotion>|null} [promotions] CreditCard promotions
     * @property {string|null} [officialUrl] CreditCard officialUrl
     */

    /**
     * Constructs a new CreditCard.
     * @exports CreditCard
     * @classdesc Represents a CreditCard.
     * @implements ICreditCard
     * @constructor
     * @param {ICreditCard=} [properties] Properties to set
     */
    function CreditCard(properties) {
        this.promotions = [];
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCard id.
     * @member {string} id
     * @memberof CreditCard
     * @instance
     */
    CreditCard.prototype.id = "";

    /**
     * CreditCard displayName.
     * @member {string} displayName
     * @memberof CreditCard
     * @instance
     */
    CreditCard.prototype.displayName = "";

    /**
     * CreditCard promotions.
     * @member {Array.<IPromotion>} promotions
     * @memberof CreditCard
     * @instance
     */
    CreditCard.prototype.promotions = $util.emptyArray;

    /**
     * CreditCard officialUrl.
     * @member {string} officialUrl
     * @memberof CreditCard
     * @instance
     */
    CreditCard.prototype.officialUrl = "";

    /**
     * Creates a new CreditCard instance using the specified properties.
     * @function create
     * @memberof CreditCard
     * @static
     * @param {ICreditCard=} [properties] Properties to set
     * @returns {CreditCard} CreditCard instance
     */
    CreditCard.create = function create(properties) {
        return new CreditCard(properties);
    };

    /**
     * Encodes the specified CreditCard message. Does not implicitly {@link CreditCard.verify|verify} messages.
     * @function encode
     * @memberof CreditCard
     * @static
     * @param {ICreditCard} message CreditCard message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCard.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && Object.hasOwnProperty.call(message, "id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && Object.hasOwnProperty.call(message, "displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        if (message.promotions != null && message.promotions.length)
            for (var i = 0; i < message.promotions.length; ++i)
                $root.Promotion.encode(message.promotions[i], writer.uint32(/* id 3, wireType 2 =*/26).fork()).ldelim();
        if (message.officialUrl != null && Object.hasOwnProperty.call(message, "officialUrl"))
            writer.uint32(/* id 4, wireType 2 =*/34).string(message.officialUrl);
        return writer;
    };

    /**
     * Encodes the specified CreditCard message, length delimited. Does not implicitly {@link CreditCard.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCard
     * @static
     * @param {ICreditCard} message CreditCard message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCard.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCard message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCard
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCard} CreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCard.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCard();
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
                message.promotions.push($root.Promotion.decode(reader, reader.uint32()));
                break;
            case 4:
                message.officialUrl = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCard message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCard
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCard} CreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCard.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCard message.
     * @function verify
     * @memberof CreditCard
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCard.verify = function verify(message) {
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
                var error = $root.Promotion.verify(message.promotions[i]);
                if (error)
                    return "promotions." + error;
            }
        }
        if (message.officialUrl != null && message.hasOwnProperty("officialUrl"))
            if (!$util.isString(message.officialUrl))
                return "officialUrl: string expected";
        return null;
    };

    /**
     * Creates a CreditCard message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCard
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCard} CreditCard
     */
    CreditCard.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCard)
            return object;
        var message = new $root.CreditCard();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        if (object.promotions) {
            if (!Array.isArray(object.promotions))
                throw TypeError(".CreditCard.promotions: array expected");
            message.promotions = [];
            for (var i = 0; i < object.promotions.length; ++i) {
                if (typeof object.promotions[i] !== "object")
                    throw TypeError(".CreditCard.promotions: object expected");
                message.promotions[i] = $root.Promotion.fromObject(object.promotions[i]);
            }
        }
        if (object.officialUrl != null)
            message.officialUrl = String(object.officialUrl);
        return message;
    };

    /**
     * Creates a plain object from a CreditCard message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCard
     * @static
     * @param {CreditCard} message CreditCard
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCard.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.arrays || options.defaults)
            object.promotions = [];
        if (options.defaults) {
            object.id = "";
            object.displayName = "";
            object.officialUrl = "";
        }
        if (message.id != null && message.hasOwnProperty("id"))
            object.id = message.id;
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            object.displayName = message.displayName;
        if (message.promotions && message.promotions.length) {
            object.promotions = [];
            for (var j = 0; j < message.promotions.length; ++j)
                object.promotions[j] = $root.Promotion.toObject(message.promotions[j], options);
        }
        if (message.officialUrl != null && message.hasOwnProperty("officialUrl"))
            object.officialUrl = message.officialUrl;
        return object;
    };

    /**
     * Converts this CreditCard to JSON.
     * @function toJSON
     * @memberof CreditCard
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCard.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCard;
})();

$root.Promotion = (function() {

    /**
     * Properties of a Promotion.
     * @exports IPromotion
     * @interface IPromotion
     * @property {string|null} [id] Promotion id
     * @property {string|null} [displayName] Promotion displayName
     * @property {string|null} [startDate] Promotion startDate
     * @property {string|null} [endDate] Promotion endDate
     * @property {string|null} [type] Promotion type
     * @property {string|null} [repeatPattern] Promotion repeatPattern
     * @property {number|null} [rate] Promotion rate
     * @property {IShoppingCategory|null} [category] Promotion category
     */

    /**
     * Constructs a new Promotion.
     * @exports Promotion
     * @classdesc Represents a Promotion.
     * @implements IPromotion
     * @constructor
     * @param {IPromotion=} [properties] Properties to set
     */
    function Promotion(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * Promotion id.
     * @member {string} id
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.id = "";

    /**
     * Promotion displayName.
     * @member {string} displayName
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.displayName = "";

    /**
     * Promotion startDate.
     * @member {string} startDate
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.startDate = "";

    /**
     * Promotion endDate.
     * @member {string} endDate
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.endDate = "";

    /**
     * Promotion type.
     * @member {string} type
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.type = "";

    /**
     * Promotion repeatPattern.
     * @member {string} repeatPattern
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.repeatPattern = "";

    /**
     * Promotion rate.
     * @member {number} rate
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.rate = 0;

    /**
     * Promotion category.
     * @member {IShoppingCategory|null|undefined} category
     * @memberof Promotion
     * @instance
     */
    Promotion.prototype.category = null;

    /**
     * Creates a new Promotion instance using the specified properties.
     * @function create
     * @memberof Promotion
     * @static
     * @param {IPromotion=} [properties] Properties to set
     * @returns {Promotion} Promotion instance
     */
    Promotion.create = function create(properties) {
        return new Promotion(properties);
    };

    /**
     * Encodes the specified Promotion message. Does not implicitly {@link Promotion.verify|verify} messages.
     * @function encode
     * @memberof Promotion
     * @static
     * @param {IPromotion} message Promotion message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    Promotion.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && Object.hasOwnProperty.call(message, "id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && Object.hasOwnProperty.call(message, "displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        if (message.startDate != null && Object.hasOwnProperty.call(message, "startDate"))
            writer.uint32(/* id 3, wireType 2 =*/26).string(message.startDate);
        if (message.endDate != null && Object.hasOwnProperty.call(message, "endDate"))
            writer.uint32(/* id 4, wireType 2 =*/34).string(message.endDate);
        if (message.type != null && Object.hasOwnProperty.call(message, "type"))
            writer.uint32(/* id 5, wireType 2 =*/42).string(message.type);
        if (message.repeatPattern != null && Object.hasOwnProperty.call(message, "repeatPattern"))
            writer.uint32(/* id 6, wireType 2 =*/50).string(message.repeatPattern);
        if (message.rate != null && Object.hasOwnProperty.call(message, "rate"))
            writer.uint32(/* id 7, wireType 5 =*/61).float(message.rate);
        if (message.category != null && Object.hasOwnProperty.call(message, "category"))
            $root.ShoppingCategory.encode(message.category, writer.uint32(/* id 8, wireType 2 =*/66).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified Promotion message, length delimited. Does not implicitly {@link Promotion.verify|verify} messages.
     * @function encodeDelimited
     * @memberof Promotion
     * @static
     * @param {IPromotion} message Promotion message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    Promotion.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a Promotion message from the specified reader or buffer.
     * @function decode
     * @memberof Promotion
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {Promotion} Promotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    Promotion.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.Promotion();
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
                message.startDate = reader.string();
                break;
            case 4:
                message.endDate = reader.string();
                break;
            case 5:
                message.type = reader.string();
                break;
            case 6:
                message.repeatPattern = reader.string();
                break;
            case 7:
                message.rate = reader.float();
                break;
            case 8:
                message.category = $root.ShoppingCategory.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a Promotion message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof Promotion
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {Promotion} Promotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    Promotion.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a Promotion message.
     * @function verify
     * @memberof Promotion
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    Promotion.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.id != null && message.hasOwnProperty("id"))
            if (!$util.isString(message.id))
                return "id: string expected";
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            if (!$util.isString(message.displayName))
                return "displayName: string expected";
        if (message.startDate != null && message.hasOwnProperty("startDate"))
            if (!$util.isString(message.startDate))
                return "startDate: string expected";
        if (message.endDate != null && message.hasOwnProperty("endDate"))
            if (!$util.isString(message.endDate))
                return "endDate: string expected";
        if (message.type != null && message.hasOwnProperty("type"))
            if (!$util.isString(message.type))
                return "type: string expected";
        if (message.repeatPattern != null && message.hasOwnProperty("repeatPattern"))
            if (!$util.isString(message.repeatPattern))
                return "repeatPattern: string expected";
        if (message.rate != null && message.hasOwnProperty("rate"))
            if (typeof message.rate !== "number")
                return "rate: number expected";
        if (message.category != null && message.hasOwnProperty("category")) {
            var error = $root.ShoppingCategory.verify(message.category);
            if (error)
                return "category." + error;
        }
        return null;
    };

    /**
     * Creates a Promotion message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof Promotion
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {Promotion} Promotion
     */
    Promotion.fromObject = function fromObject(object) {
        if (object instanceof $root.Promotion)
            return object;
        var message = new $root.Promotion();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        if (object.startDate != null)
            message.startDate = String(object.startDate);
        if (object.endDate != null)
            message.endDate = String(object.endDate);
        if (object.type != null)
            message.type = String(object.type);
        if (object.repeatPattern != null)
            message.repeatPattern = String(object.repeatPattern);
        if (object.rate != null)
            message.rate = Number(object.rate);
        if (object.category != null) {
            if (typeof object.category !== "object")
                throw TypeError(".Promotion.category: object expected");
            message.category = $root.ShoppingCategory.fromObject(object.category);
        }
        return message;
    };

    /**
     * Creates a plain object from a Promotion message. Also converts values to other types if specified.
     * @function toObject
     * @memberof Promotion
     * @static
     * @param {Promotion} message Promotion
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    Promotion.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.id = "";
            object.displayName = "";
            object.startDate = "";
            object.endDate = "";
            object.type = "";
            object.repeatPattern = "";
            object.rate = 0;
            object.category = null;
        }
        if (message.id != null && message.hasOwnProperty("id"))
            object.id = message.id;
        if (message.displayName != null && message.hasOwnProperty("displayName"))
            object.displayName = message.displayName;
        if (message.startDate != null && message.hasOwnProperty("startDate"))
            object.startDate = message.startDate;
        if (message.endDate != null && message.hasOwnProperty("endDate"))
            object.endDate = message.endDate;
        if (message.type != null && message.hasOwnProperty("type"))
            object.type = message.type;
        if (message.repeatPattern != null && message.hasOwnProperty("repeatPattern"))
            object.repeatPattern = message.repeatPattern;
        if (message.rate != null && message.hasOwnProperty("rate"))
            object.rate = options.json && !isFinite(message.rate) ? String(message.rate) : message.rate;
        if (message.category != null && message.hasOwnProperty("category"))
            object.category = $root.ShoppingCategory.toObject(message.category, options);
        return object;
    };

    /**
     * Converts this Promotion to JSON.
     * @function toJSON
     * @memberof Promotion
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    Promotion.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return Promotion;
})();

$root.ShoppingCategory = (function() {

    /**
     * Properties of a ShoppingCategory.
     * @exports IShoppingCategory
     * @interface IShoppingCategory
     * @property {string|null} [id] ShoppingCategory id
     * @property {string|null} [displayName] ShoppingCategory displayName
     */

    /**
     * Constructs a new ShoppingCategory.
     * @exports ShoppingCategory
     * @classdesc Represents a ShoppingCategory.
     * @implements IShoppingCategory
     * @constructor
     * @param {IShoppingCategory=} [properties] Properties to set
     */
    function ShoppingCategory(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * ShoppingCategory id.
     * @member {string} id
     * @memberof ShoppingCategory
     * @instance
     */
    ShoppingCategory.prototype.id = "";

    /**
     * ShoppingCategory displayName.
     * @member {string} displayName
     * @memberof ShoppingCategory
     * @instance
     */
    ShoppingCategory.prototype.displayName = "";

    /**
     * Creates a new ShoppingCategory instance using the specified properties.
     * @function create
     * @memberof ShoppingCategory
     * @static
     * @param {IShoppingCategory=} [properties] Properties to set
     * @returns {ShoppingCategory} ShoppingCategory instance
     */
    ShoppingCategory.create = function create(properties) {
        return new ShoppingCategory(properties);
    };

    /**
     * Encodes the specified ShoppingCategory message. Does not implicitly {@link ShoppingCategory.verify|verify} messages.
     * @function encode
     * @memberof ShoppingCategory
     * @static
     * @param {IShoppingCategory} message ShoppingCategory message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ShoppingCategory.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.id != null && Object.hasOwnProperty.call(message, "id"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.id);
        if (message.displayName != null && Object.hasOwnProperty.call(message, "displayName"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.displayName);
        return writer;
    };

    /**
     * Encodes the specified ShoppingCategory message, length delimited. Does not implicitly {@link ShoppingCategory.verify|verify} messages.
     * @function encodeDelimited
     * @memberof ShoppingCategory
     * @static
     * @param {IShoppingCategory} message ShoppingCategory message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    ShoppingCategory.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a ShoppingCategory message from the specified reader or buffer.
     * @function decode
     * @memberof ShoppingCategory
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {ShoppingCategory} ShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ShoppingCategory.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.ShoppingCategory();
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
     * Decodes a ShoppingCategory message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof ShoppingCategory
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {ShoppingCategory} ShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    ShoppingCategory.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a ShoppingCategory message.
     * @function verify
     * @memberof ShoppingCategory
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    ShoppingCategory.verify = function verify(message) {
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
     * Creates a ShoppingCategory message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof ShoppingCategory
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {ShoppingCategory} ShoppingCategory
     */
    ShoppingCategory.fromObject = function fromObject(object) {
        if (object instanceof $root.ShoppingCategory)
            return object;
        var message = new $root.ShoppingCategory();
        if (object.id != null)
            message.id = String(object.id);
        if (object.displayName != null)
            message.displayName = String(object.displayName);
        return message;
    };

    /**
     * Creates a plain object from a ShoppingCategory message. Also converts values to other types if specified.
     * @function toObject
     * @memberof ShoppingCategory
     * @static
     * @param {ShoppingCategory} message ShoppingCategory
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    ShoppingCategory.toObject = function toObject(message, options) {
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
     * Converts this ShoppingCategory to JSON.
     * @function toJSON
     * @memberof ShoppingCategory
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    ShoppingCategory.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return ShoppingCategory;
})();

$root.CreditCardCreationRequest = (function() {

    /**
     * Properties of a CreditCardCreationRequest.
     * @exports ICreditCardCreationRequest
     * @interface ICreditCardCreationRequest
     * @property {boolean|null} [valid] CreditCardCreationRequest valid
     * @property {ICreditCard|null} [cardData] CreditCardCreationRequest cardData
     */

    /**
     * Constructs a new CreditCardCreationRequest.
     * @exports CreditCardCreationRequest
     * @classdesc Represents a CreditCardCreationRequest.
     * @implements ICreditCardCreationRequest
     * @constructor
     * @param {ICreditCardCreationRequest=} [properties] Properties to set
     */
    function CreditCardCreationRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCardCreationRequest valid.
     * @member {boolean} valid
     * @memberof CreditCardCreationRequest
     * @instance
     */
    CreditCardCreationRequest.prototype.valid = false;

    /**
     * CreditCardCreationRequest cardData.
     * @member {ICreditCard|null|undefined} cardData
     * @memberof CreditCardCreationRequest
     * @instance
     */
    CreditCardCreationRequest.prototype.cardData = null;

    /**
     * Creates a new CreditCardCreationRequest instance using the specified properties.
     * @function create
     * @memberof CreditCardCreationRequest
     * @static
     * @param {ICreditCardCreationRequest=} [properties] Properties to set
     * @returns {CreditCardCreationRequest} CreditCardCreationRequest instance
     */
    CreditCardCreationRequest.create = function create(properties) {
        return new CreditCardCreationRequest(properties);
    };

    /**
     * Encodes the specified CreditCardCreationRequest message. Does not implicitly {@link CreditCardCreationRequest.verify|verify} messages.
     * @function encode
     * @memberof CreditCardCreationRequest
     * @static
     * @param {ICreditCardCreationRequest} message CreditCardCreationRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardCreationRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.cardData != null && Object.hasOwnProperty.call(message, "cardData"))
            $root.CreditCard.encode(message.cardData, writer.uint32(/* id 2, wireType 2 =*/18).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified CreditCardCreationRequest message, length delimited. Does not implicitly {@link CreditCardCreationRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCardCreationRequest
     * @static
     * @param {ICreditCardCreationRequest} message CreditCardCreationRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardCreationRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCardCreationRequest message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCardCreationRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCardCreationRequest} CreditCardCreationRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardCreationRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCardCreationRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.cardData = $root.CreditCard.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCardCreationRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCardCreationRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCardCreationRequest} CreditCardCreationRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardCreationRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCardCreationRequest message.
     * @function verify
     * @memberof CreditCardCreationRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCardCreationRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.cardData != null && message.hasOwnProperty("cardData")) {
            var error = $root.CreditCard.verify(message.cardData);
            if (error)
                return "cardData." + error;
        }
        return null;
    };

    /**
     * Creates a CreditCardCreationRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCardCreationRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCardCreationRequest} CreditCardCreationRequest
     */
    CreditCardCreationRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCardCreationRequest)
            return object;
        var message = new $root.CreditCardCreationRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.cardData != null) {
            if (typeof object.cardData !== "object")
                throw TypeError(".CreditCardCreationRequest.cardData: object expected");
            message.cardData = $root.CreditCard.fromObject(object.cardData);
        }
        return message;
    };

    /**
     * Creates a plain object from a CreditCardCreationRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCardCreationRequest
     * @static
     * @param {CreditCardCreationRequest} message CreditCardCreationRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCardCreationRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.cardData = null;
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.cardData != null && message.hasOwnProperty("cardData"))
            object.cardData = $root.CreditCard.toObject(message.cardData, options);
        return object;
    };

    /**
     * Converts this CreditCardCreationRequest to JSON.
     * @function toJSON
     * @memberof CreditCardCreationRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCardCreationRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCardCreationRequest;
})();

$root.CreditCardUpdateRequest = (function() {

    /**
     * Properties of a CreditCardUpdateRequest.
     * @exports ICreditCardUpdateRequest
     * @interface ICreditCardUpdateRequest
     * @property {boolean|null} [valid] CreditCardUpdateRequest valid
     * @property {ICreditCard|null} [updatedCardData] CreditCardUpdateRequest updatedCardData
     */

    /**
     * Constructs a new CreditCardUpdateRequest.
     * @exports CreditCardUpdateRequest
     * @classdesc Represents a CreditCardUpdateRequest.
     * @implements ICreditCardUpdateRequest
     * @constructor
     * @param {ICreditCardUpdateRequest=} [properties] Properties to set
     */
    function CreditCardUpdateRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCardUpdateRequest valid.
     * @member {boolean} valid
     * @memberof CreditCardUpdateRequest
     * @instance
     */
    CreditCardUpdateRequest.prototype.valid = false;

    /**
     * CreditCardUpdateRequest updatedCardData.
     * @member {ICreditCard|null|undefined} updatedCardData
     * @memberof CreditCardUpdateRequest
     * @instance
     */
    CreditCardUpdateRequest.prototype.updatedCardData = null;

    /**
     * Creates a new CreditCardUpdateRequest instance using the specified properties.
     * @function create
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {ICreditCardUpdateRequest=} [properties] Properties to set
     * @returns {CreditCardUpdateRequest} CreditCardUpdateRequest instance
     */
    CreditCardUpdateRequest.create = function create(properties) {
        return new CreditCardUpdateRequest(properties);
    };

    /**
     * Encodes the specified CreditCardUpdateRequest message. Does not implicitly {@link CreditCardUpdateRequest.verify|verify} messages.
     * @function encode
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {ICreditCardUpdateRequest} message CreditCardUpdateRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardUpdateRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.updatedCardData != null && Object.hasOwnProperty.call(message, "updatedCardData"))
            $root.CreditCard.encode(message.updatedCardData, writer.uint32(/* id 2, wireType 2 =*/18).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified CreditCardUpdateRequest message, length delimited. Does not implicitly {@link CreditCardUpdateRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {ICreditCardUpdateRequest} message CreditCardUpdateRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardUpdateRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCardUpdateRequest message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCardUpdateRequest} CreditCardUpdateRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardUpdateRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCardUpdateRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.updatedCardData = $root.CreditCard.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCardUpdateRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCardUpdateRequest} CreditCardUpdateRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardUpdateRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCardUpdateRequest message.
     * @function verify
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCardUpdateRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.updatedCardData != null && message.hasOwnProperty("updatedCardData")) {
            var error = $root.CreditCard.verify(message.updatedCardData);
            if (error)
                return "updatedCardData." + error;
        }
        return null;
    };

    /**
     * Creates a CreditCardUpdateRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCardUpdateRequest} CreditCardUpdateRequest
     */
    CreditCardUpdateRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCardUpdateRequest)
            return object;
        var message = new $root.CreditCardUpdateRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.updatedCardData != null) {
            if (typeof object.updatedCardData !== "object")
                throw TypeError(".CreditCardUpdateRequest.updatedCardData: object expected");
            message.updatedCardData = $root.CreditCard.fromObject(object.updatedCardData);
        }
        return message;
    };

    /**
     * Creates a plain object from a CreditCardUpdateRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCardUpdateRequest
     * @static
     * @param {CreditCardUpdateRequest} message CreditCardUpdateRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCardUpdateRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.updatedCardData = null;
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.updatedCardData != null && message.hasOwnProperty("updatedCardData"))
            object.updatedCardData = $root.CreditCard.toObject(message.updatedCardData, options);
        return object;
    };

    /**
     * Converts this CreditCardUpdateRequest to JSON.
     * @function toJSON
     * @memberof CreditCardUpdateRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCardUpdateRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCardUpdateRequest;
})();

$root.CreditCardRemovalRequest = (function() {

    /**
     * Properties of a CreditCardRemovalRequest.
     * @exports ICreditCardRemovalRequest
     * @interface ICreditCardRemovalRequest
     * @property {boolean|null} [valid] CreditCardRemovalRequest valid
     * @property {string|null} [cardId] CreditCardRemovalRequest cardId
     */

    /**
     * Constructs a new CreditCardRemovalRequest.
     * @exports CreditCardRemovalRequest
     * @classdesc Represents a CreditCardRemovalRequest.
     * @implements ICreditCardRemovalRequest
     * @constructor
     * @param {ICreditCardRemovalRequest=} [properties] Properties to set
     */
    function CreditCardRemovalRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCardRemovalRequest valid.
     * @member {boolean} valid
     * @memberof CreditCardRemovalRequest
     * @instance
     */
    CreditCardRemovalRequest.prototype.valid = false;

    /**
     * CreditCardRemovalRequest cardId.
     * @member {string} cardId
     * @memberof CreditCardRemovalRequest
     * @instance
     */
    CreditCardRemovalRequest.prototype.cardId = "";

    /**
     * Creates a new CreditCardRemovalRequest instance using the specified properties.
     * @function create
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {ICreditCardRemovalRequest=} [properties] Properties to set
     * @returns {CreditCardRemovalRequest} CreditCardRemovalRequest instance
     */
    CreditCardRemovalRequest.create = function create(properties) {
        return new CreditCardRemovalRequest(properties);
    };

    /**
     * Encodes the specified CreditCardRemovalRequest message. Does not implicitly {@link CreditCardRemovalRequest.verify|verify} messages.
     * @function encode
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {ICreditCardRemovalRequest} message CreditCardRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardRemovalRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.cardId != null && Object.hasOwnProperty.call(message, "cardId"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.cardId);
        return writer;
    };

    /**
     * Encodes the specified CreditCardRemovalRequest message, length delimited. Does not implicitly {@link CreditCardRemovalRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {ICreditCardRemovalRequest} message CreditCardRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardRemovalRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCardRemovalRequest message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCardRemovalRequest} CreditCardRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardRemovalRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCardRemovalRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.cardId = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCardRemovalRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCardRemovalRequest} CreditCardRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardRemovalRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCardRemovalRequest message.
     * @function verify
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCardRemovalRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.cardId != null && message.hasOwnProperty("cardId"))
            if (!$util.isString(message.cardId))
                return "cardId: string expected";
        return null;
    };

    /**
     * Creates a CreditCardRemovalRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCardRemovalRequest} CreditCardRemovalRequest
     */
    CreditCardRemovalRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCardRemovalRequest)
            return object;
        var message = new $root.CreditCardRemovalRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.cardId != null)
            message.cardId = String(object.cardId);
        return message;
    };

    /**
     * Creates a plain object from a CreditCardRemovalRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCardRemovalRequest
     * @static
     * @param {CreditCardRemovalRequest} message CreditCardRemovalRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCardRemovalRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.cardId = "";
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.cardId != null && message.hasOwnProperty("cardId"))
            object.cardId = message.cardId;
        return object;
    };

    /**
     * Converts this CreditCardRemovalRequest to JSON.
     * @function toJSON
     * @memberof CreditCardRemovalRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCardRemovalRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCardRemovalRequest;
})();

$root.CreditCardFetchRequest = (function() {

    /**
     * Properties of a CreditCardFetchRequest.
     * @exports ICreditCardFetchRequest
     * @interface ICreditCardFetchRequest
     * @property {string|null} [cardId] CreditCardFetchRequest cardId
     */

    /**
     * Constructs a new CreditCardFetchRequest.
     * @exports CreditCardFetchRequest
     * @classdesc Represents a CreditCardFetchRequest.
     * @implements ICreditCardFetchRequest
     * @constructor
     * @param {ICreditCardFetchRequest=} [properties] Properties to set
     */
    function CreditCardFetchRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * CreditCardFetchRequest cardId.
     * @member {string} cardId
     * @memberof CreditCardFetchRequest
     * @instance
     */
    CreditCardFetchRequest.prototype.cardId = "";

    /**
     * Creates a new CreditCardFetchRequest instance using the specified properties.
     * @function create
     * @memberof CreditCardFetchRequest
     * @static
     * @param {ICreditCardFetchRequest=} [properties] Properties to set
     * @returns {CreditCardFetchRequest} CreditCardFetchRequest instance
     */
    CreditCardFetchRequest.create = function create(properties) {
        return new CreditCardFetchRequest(properties);
    };

    /**
     * Encodes the specified CreditCardFetchRequest message. Does not implicitly {@link CreditCardFetchRequest.verify|verify} messages.
     * @function encode
     * @memberof CreditCardFetchRequest
     * @static
     * @param {ICreditCardFetchRequest} message CreditCardFetchRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardFetchRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.cardId != null && Object.hasOwnProperty.call(message, "cardId"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.cardId);
        return writer;
    };

    /**
     * Encodes the specified CreditCardFetchRequest message, length delimited. Does not implicitly {@link CreditCardFetchRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof CreditCardFetchRequest
     * @static
     * @param {ICreditCardFetchRequest} message CreditCardFetchRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    CreditCardFetchRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a CreditCardFetchRequest message from the specified reader or buffer.
     * @function decode
     * @memberof CreditCardFetchRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {CreditCardFetchRequest} CreditCardFetchRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardFetchRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.CreditCardFetchRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.cardId = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a CreditCardFetchRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof CreditCardFetchRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {CreditCardFetchRequest} CreditCardFetchRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    CreditCardFetchRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a CreditCardFetchRequest message.
     * @function verify
     * @memberof CreditCardFetchRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    CreditCardFetchRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.cardId != null && message.hasOwnProperty("cardId"))
            if (!$util.isString(message.cardId))
                return "cardId: string expected";
        return null;
    };

    /**
     * Creates a CreditCardFetchRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof CreditCardFetchRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {CreditCardFetchRequest} CreditCardFetchRequest
     */
    CreditCardFetchRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.CreditCardFetchRequest)
            return object;
        var message = new $root.CreditCardFetchRequest();
        if (object.cardId != null)
            message.cardId = String(object.cardId);
        return message;
    };

    /**
     * Creates a plain object from a CreditCardFetchRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof CreditCardFetchRequest
     * @static
     * @param {CreditCardFetchRequest} message CreditCardFetchRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    CreditCardFetchRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults)
            object.cardId = "";
        if (message.cardId != null && message.hasOwnProperty("cardId"))
            object.cardId = message.cardId;
        return object;
    };

    /**
     * Converts this CreditCardFetchRequest to JSON.
     * @function toJSON
     * @memberof CreditCardFetchRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    CreditCardFetchRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return CreditCardFetchRequest;
})();

$root.PromotionAdditionRequest = (function() {

    /**
     * Properties of a PromotionAdditionRequest.
     * @exports IPromotionAdditionRequest
     * @interface IPromotionAdditionRequest
     * @property {boolean|null} [valid] PromotionAdditionRequest valid
     * @property {string|null} [targetCardId] PromotionAdditionRequest targetCardId
     * @property {IPromotion|null} [promotionData] PromotionAdditionRequest promotionData
     */

    /**
     * Constructs a new PromotionAdditionRequest.
     * @exports PromotionAdditionRequest
     * @classdesc Represents a PromotionAdditionRequest.
     * @implements IPromotionAdditionRequest
     * @constructor
     * @param {IPromotionAdditionRequest=} [properties] Properties to set
     */
    function PromotionAdditionRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * PromotionAdditionRequest valid.
     * @member {boolean} valid
     * @memberof PromotionAdditionRequest
     * @instance
     */
    PromotionAdditionRequest.prototype.valid = false;

    /**
     * PromotionAdditionRequest targetCardId.
     * @member {string} targetCardId
     * @memberof PromotionAdditionRequest
     * @instance
     */
    PromotionAdditionRequest.prototype.targetCardId = "";

    /**
     * PromotionAdditionRequest promotionData.
     * @member {IPromotion|null|undefined} promotionData
     * @memberof PromotionAdditionRequest
     * @instance
     */
    PromotionAdditionRequest.prototype.promotionData = null;

    /**
     * Creates a new PromotionAdditionRequest instance using the specified properties.
     * @function create
     * @memberof PromotionAdditionRequest
     * @static
     * @param {IPromotionAdditionRequest=} [properties] Properties to set
     * @returns {PromotionAdditionRequest} PromotionAdditionRequest instance
     */
    PromotionAdditionRequest.create = function create(properties) {
        return new PromotionAdditionRequest(properties);
    };

    /**
     * Encodes the specified PromotionAdditionRequest message. Does not implicitly {@link PromotionAdditionRequest.verify|verify} messages.
     * @function encode
     * @memberof PromotionAdditionRequest
     * @static
     * @param {IPromotionAdditionRequest} message PromotionAdditionRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionAdditionRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.targetCardId != null && Object.hasOwnProperty.call(message, "targetCardId"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.targetCardId);
        if (message.promotionData != null && Object.hasOwnProperty.call(message, "promotionData"))
            $root.Promotion.encode(message.promotionData, writer.uint32(/* id 3, wireType 2 =*/26).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified PromotionAdditionRequest message, length delimited. Does not implicitly {@link PromotionAdditionRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof PromotionAdditionRequest
     * @static
     * @param {IPromotionAdditionRequest} message PromotionAdditionRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionAdditionRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a PromotionAdditionRequest message from the specified reader or buffer.
     * @function decode
     * @memberof PromotionAdditionRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {PromotionAdditionRequest} PromotionAdditionRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionAdditionRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.PromotionAdditionRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.targetCardId = reader.string();
                break;
            case 3:
                message.promotionData = $root.Promotion.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a PromotionAdditionRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof PromotionAdditionRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {PromotionAdditionRequest} PromotionAdditionRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionAdditionRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a PromotionAdditionRequest message.
     * @function verify
     * @memberof PromotionAdditionRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    PromotionAdditionRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            if (!$util.isString(message.targetCardId))
                return "targetCardId: string expected";
        if (message.promotionData != null && message.hasOwnProperty("promotionData")) {
            var error = $root.Promotion.verify(message.promotionData);
            if (error)
                return "promotionData." + error;
        }
        return null;
    };

    /**
     * Creates a PromotionAdditionRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof PromotionAdditionRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {PromotionAdditionRequest} PromotionAdditionRequest
     */
    PromotionAdditionRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.PromotionAdditionRequest)
            return object;
        var message = new $root.PromotionAdditionRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.targetCardId != null)
            message.targetCardId = String(object.targetCardId);
        if (object.promotionData != null) {
            if (typeof object.promotionData !== "object")
                throw TypeError(".PromotionAdditionRequest.promotionData: object expected");
            message.promotionData = $root.Promotion.fromObject(object.promotionData);
        }
        return message;
    };

    /**
     * Creates a plain object from a PromotionAdditionRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof PromotionAdditionRequest
     * @static
     * @param {PromotionAdditionRequest} message PromotionAdditionRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    PromotionAdditionRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.targetCardId = "";
            object.promotionData = null;
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            object.targetCardId = message.targetCardId;
        if (message.promotionData != null && message.hasOwnProperty("promotionData"))
            object.promotionData = $root.Promotion.toObject(message.promotionData, options);
        return object;
    };

    /**
     * Converts this PromotionAdditionRequest to JSON.
     * @function toJSON
     * @memberof PromotionAdditionRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    PromotionAdditionRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return PromotionAdditionRequest;
})();

$root.PromotionRemovalRequest = (function() {

    /**
     * Properties of a PromotionRemovalRequest.
     * @exports IPromotionRemovalRequest
     * @interface IPromotionRemovalRequest
     * @property {boolean|null} [valid] PromotionRemovalRequest valid
     * @property {string|null} [targetCardId] PromotionRemovalRequest targetCardId
     * @property {string|null} [targetPromotionId] PromotionRemovalRequest targetPromotionId
     */

    /**
     * Constructs a new PromotionRemovalRequest.
     * @exports PromotionRemovalRequest
     * @classdesc Represents a PromotionRemovalRequest.
     * @implements IPromotionRemovalRequest
     * @constructor
     * @param {IPromotionRemovalRequest=} [properties] Properties to set
     */
    function PromotionRemovalRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * PromotionRemovalRequest valid.
     * @member {boolean} valid
     * @memberof PromotionRemovalRequest
     * @instance
     */
    PromotionRemovalRequest.prototype.valid = false;

    /**
     * PromotionRemovalRequest targetCardId.
     * @member {string} targetCardId
     * @memberof PromotionRemovalRequest
     * @instance
     */
    PromotionRemovalRequest.prototype.targetCardId = "";

    /**
     * PromotionRemovalRequest targetPromotionId.
     * @member {string} targetPromotionId
     * @memberof PromotionRemovalRequest
     * @instance
     */
    PromotionRemovalRequest.prototype.targetPromotionId = "";

    /**
     * Creates a new PromotionRemovalRequest instance using the specified properties.
     * @function create
     * @memberof PromotionRemovalRequest
     * @static
     * @param {IPromotionRemovalRequest=} [properties] Properties to set
     * @returns {PromotionRemovalRequest} PromotionRemovalRequest instance
     */
    PromotionRemovalRequest.create = function create(properties) {
        return new PromotionRemovalRequest(properties);
    };

    /**
     * Encodes the specified PromotionRemovalRequest message. Does not implicitly {@link PromotionRemovalRequest.verify|verify} messages.
     * @function encode
     * @memberof PromotionRemovalRequest
     * @static
     * @param {IPromotionRemovalRequest} message PromotionRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionRemovalRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.valid != null && Object.hasOwnProperty.call(message, "valid"))
            writer.uint32(/* id 1, wireType 0 =*/8).bool(message.valid);
        if (message.targetCardId != null && Object.hasOwnProperty.call(message, "targetCardId"))
            writer.uint32(/* id 2, wireType 2 =*/18).string(message.targetCardId);
        if (message.targetPromotionId != null && Object.hasOwnProperty.call(message, "targetPromotionId"))
            writer.uint32(/* id 3, wireType 2 =*/26).string(message.targetPromotionId);
        return writer;
    };

    /**
     * Encodes the specified PromotionRemovalRequest message, length delimited. Does not implicitly {@link PromotionRemovalRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof PromotionRemovalRequest
     * @static
     * @param {IPromotionRemovalRequest} message PromotionRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionRemovalRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a PromotionRemovalRequest message from the specified reader or buffer.
     * @function decode
     * @memberof PromotionRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {PromotionRemovalRequest} PromotionRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionRemovalRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.PromotionRemovalRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.valid = reader.bool();
                break;
            case 2:
                message.targetCardId = reader.string();
                break;
            case 3:
                message.targetPromotionId = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a PromotionRemovalRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof PromotionRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {PromotionRemovalRequest} PromotionRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionRemovalRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a PromotionRemovalRequest message.
     * @function verify
     * @memberof PromotionRemovalRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    PromotionRemovalRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.valid != null && message.hasOwnProperty("valid"))
            if (typeof message.valid !== "boolean")
                return "valid: boolean expected";
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            if (!$util.isString(message.targetCardId))
                return "targetCardId: string expected";
        if (message.targetPromotionId != null && message.hasOwnProperty("targetPromotionId"))
            if (!$util.isString(message.targetPromotionId))
                return "targetPromotionId: string expected";
        return null;
    };

    /**
     * Creates a PromotionRemovalRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof PromotionRemovalRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {PromotionRemovalRequest} PromotionRemovalRequest
     */
    PromotionRemovalRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.PromotionRemovalRequest)
            return object;
        var message = new $root.PromotionRemovalRequest();
        if (object.valid != null)
            message.valid = Boolean(object.valid);
        if (object.targetCardId != null)
            message.targetCardId = String(object.targetCardId);
        if (object.targetPromotionId != null)
            message.targetPromotionId = String(object.targetPromotionId);
        return message;
    };

    /**
     * Creates a plain object from a PromotionRemovalRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof PromotionRemovalRequest
     * @static
     * @param {PromotionRemovalRequest} message PromotionRemovalRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    PromotionRemovalRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.valid = false;
            object.targetCardId = "";
            object.targetPromotionId = "";
        }
        if (message.valid != null && message.hasOwnProperty("valid"))
            object.valid = message.valid;
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            object.targetCardId = message.targetCardId;
        if (message.targetPromotionId != null && message.hasOwnProperty("targetPromotionId"))
            object.targetPromotionId = message.targetPromotionId;
        return object;
    };

    /**
     * Converts this PromotionRemovalRequest to JSON.
     * @function toJSON
     * @memberof PromotionRemovalRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    PromotionRemovalRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return PromotionRemovalRequest;
})();

$root.PromotionUpdateRequest = (function() {

    /**
     * Properties of a PromotionUpdateRequest.
     * @exports IPromotionUpdateRequest
     * @interface IPromotionUpdateRequest
     * @property {string|null} [targetCardId] PromotionUpdateRequest targetCardId
     * @property {IPromotion|null} [updatedPromotionData] PromotionUpdateRequest updatedPromotionData
     */

    /**
     * Constructs a new PromotionUpdateRequest.
     * @exports PromotionUpdateRequest
     * @classdesc Represents a PromotionUpdateRequest.
     * @implements IPromotionUpdateRequest
     * @constructor
     * @param {IPromotionUpdateRequest=} [properties] Properties to set
     */
    function PromotionUpdateRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * PromotionUpdateRequest targetCardId.
     * @member {string} targetCardId
     * @memberof PromotionUpdateRequest
     * @instance
     */
    PromotionUpdateRequest.prototype.targetCardId = "";

    /**
     * PromotionUpdateRequest updatedPromotionData.
     * @member {IPromotion|null|undefined} updatedPromotionData
     * @memberof PromotionUpdateRequest
     * @instance
     */
    PromotionUpdateRequest.prototype.updatedPromotionData = null;

    /**
     * Creates a new PromotionUpdateRequest instance using the specified properties.
     * @function create
     * @memberof PromotionUpdateRequest
     * @static
     * @param {IPromotionUpdateRequest=} [properties] Properties to set
     * @returns {PromotionUpdateRequest} PromotionUpdateRequest instance
     */
    PromotionUpdateRequest.create = function create(properties) {
        return new PromotionUpdateRequest(properties);
    };

    /**
     * Encodes the specified PromotionUpdateRequest message. Does not implicitly {@link PromotionUpdateRequest.verify|verify} messages.
     * @function encode
     * @memberof PromotionUpdateRequest
     * @static
     * @param {IPromotionUpdateRequest} message PromotionUpdateRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionUpdateRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.targetCardId != null && Object.hasOwnProperty.call(message, "targetCardId"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.targetCardId);
        if (message.updatedPromotionData != null && Object.hasOwnProperty.call(message, "updatedPromotionData"))
            $root.Promotion.encode(message.updatedPromotionData, writer.uint32(/* id 2, wireType 2 =*/18).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified PromotionUpdateRequest message, length delimited. Does not implicitly {@link PromotionUpdateRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof PromotionUpdateRequest
     * @static
     * @param {IPromotionUpdateRequest} message PromotionUpdateRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    PromotionUpdateRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a PromotionUpdateRequest message from the specified reader or buffer.
     * @function decode
     * @memberof PromotionUpdateRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {PromotionUpdateRequest} PromotionUpdateRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionUpdateRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.PromotionUpdateRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.targetCardId = reader.string();
                break;
            case 2:
                message.updatedPromotionData = $root.Promotion.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a PromotionUpdateRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof PromotionUpdateRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {PromotionUpdateRequest} PromotionUpdateRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    PromotionUpdateRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a PromotionUpdateRequest message.
     * @function verify
     * @memberof PromotionUpdateRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    PromotionUpdateRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            if (!$util.isString(message.targetCardId))
                return "targetCardId: string expected";
        if (message.updatedPromotionData != null && message.hasOwnProperty("updatedPromotionData")) {
            var error = $root.Promotion.verify(message.updatedPromotionData);
            if (error)
                return "updatedPromotionData." + error;
        }
        return null;
    };

    /**
     * Creates a PromotionUpdateRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof PromotionUpdateRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {PromotionUpdateRequest} PromotionUpdateRequest
     */
    PromotionUpdateRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.PromotionUpdateRequest)
            return object;
        var message = new $root.PromotionUpdateRequest();
        if (object.targetCardId != null)
            message.targetCardId = String(object.targetCardId);
        if (object.updatedPromotionData != null) {
            if (typeof object.updatedPromotionData !== "object")
                throw TypeError(".PromotionUpdateRequest.updatedPromotionData: object expected");
            message.updatedPromotionData = $root.Promotion.fromObject(object.updatedPromotionData);
        }
        return message;
    };

    /**
     * Creates a plain object from a PromotionUpdateRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof PromotionUpdateRequest
     * @static
     * @param {PromotionUpdateRequest} message PromotionUpdateRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    PromotionUpdateRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.targetCardId = "";
            object.updatedPromotionData = null;
        }
        if (message.targetCardId != null && message.hasOwnProperty("targetCardId"))
            object.targetCardId = message.targetCardId;
        if (message.updatedPromotionData != null && message.hasOwnProperty("updatedPromotionData"))
            object.updatedPromotionData = $root.Promotion.toObject(message.updatedPromotionData, options);
        return object;
    };

    /**
     * Converts this PromotionUpdateRequest to JSON.
     * @function toJSON
     * @memberof PromotionUpdateRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    PromotionUpdateRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return PromotionUpdateRequest;
})();

$root.UserRemovalRequest = (function() {

    /**
     * Properties of a UserRemovalRequest.
     * @exports IUserRemovalRequest
     * @interface IUserRemovalRequest
     * @property {string|null} [username] UserRemovalRequest username
     */

    /**
     * Constructs a new UserRemovalRequest.
     * @exports UserRemovalRequest
     * @classdesc Represents a UserRemovalRequest.
     * @implements IUserRemovalRequest
     * @constructor
     * @param {IUserRemovalRequest=} [properties] Properties to set
     */
    function UserRemovalRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * UserRemovalRequest username.
     * @member {string} username
     * @memberof UserRemovalRequest
     * @instance
     */
    UserRemovalRequest.prototype.username = "";

    /**
     * Creates a new UserRemovalRequest instance using the specified properties.
     * @function create
     * @memberof UserRemovalRequest
     * @static
     * @param {IUserRemovalRequest=} [properties] Properties to set
     * @returns {UserRemovalRequest} UserRemovalRequest instance
     */
    UserRemovalRequest.create = function create(properties) {
        return new UserRemovalRequest(properties);
    };

    /**
     * Encodes the specified UserRemovalRequest message. Does not implicitly {@link UserRemovalRequest.verify|verify} messages.
     * @function encode
     * @memberof UserRemovalRequest
     * @static
     * @param {IUserRemovalRequest} message UserRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    UserRemovalRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.username != null && Object.hasOwnProperty.call(message, "username"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.username);
        return writer;
    };

    /**
     * Encodes the specified UserRemovalRequest message, length delimited. Does not implicitly {@link UserRemovalRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof UserRemovalRequest
     * @static
     * @param {IUserRemovalRequest} message UserRemovalRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    UserRemovalRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a UserRemovalRequest message from the specified reader or buffer.
     * @function decode
     * @memberof UserRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {UserRemovalRequest} UserRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    UserRemovalRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.UserRemovalRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.username = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a UserRemovalRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof UserRemovalRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {UserRemovalRequest} UserRemovalRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    UserRemovalRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a UserRemovalRequest message.
     * @function verify
     * @memberof UserRemovalRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    UserRemovalRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.username != null && message.hasOwnProperty("username"))
            if (!$util.isString(message.username))
                return "username: string expected";
        return null;
    };

    /**
     * Creates a UserRemovalRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof UserRemovalRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {UserRemovalRequest} UserRemovalRequest
     */
    UserRemovalRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.UserRemovalRequest)
            return object;
        var message = new $root.UserRemovalRequest();
        if (object.username != null)
            message.username = String(object.username);
        return message;
    };

    /**
     * Creates a plain object from a UserRemovalRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof UserRemovalRequest
     * @static
     * @param {UserRemovalRequest} message UserRemovalRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    UserRemovalRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults)
            object.username = "";
        if (message.username != null && message.hasOwnProperty("username"))
            object.username = message.username;
        return object;
    };

    /**
     * Converts this UserRemovalRequest to JSON.
     * @function toJSON
     * @memberof UserRemovalRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    UserRemovalRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return UserRemovalRequest;
})();

$root.HttpBasedCredential = (function() {

    /**
     * Properties of a HttpBasedCredential.
     * @exports IHttpBasedCredential
     * @interface IHttpBasedCredential
     * @property {string|null} [token] HttpBasedCredential token
     */

    /**
     * Constructs a new HttpBasedCredential.
     * @exports HttpBasedCredential
     * @classdesc Represents a HttpBasedCredential.
     * @implements IHttpBasedCredential
     * @constructor
     * @param {IHttpBasedCredential=} [properties] Properties to set
     */
    function HttpBasedCredential(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * HttpBasedCredential token.
     * @member {string} token
     * @memberof HttpBasedCredential
     * @instance
     */
    HttpBasedCredential.prototype.token = "";

    /**
     * Creates a new HttpBasedCredential instance using the specified properties.
     * @function create
     * @memberof HttpBasedCredential
     * @static
     * @param {IHttpBasedCredential=} [properties] Properties to set
     * @returns {HttpBasedCredential} HttpBasedCredential instance
     */
    HttpBasedCredential.create = function create(properties) {
        return new HttpBasedCredential(properties);
    };

    /**
     * Encodes the specified HttpBasedCredential message. Does not implicitly {@link HttpBasedCredential.verify|verify} messages.
     * @function encode
     * @memberof HttpBasedCredential
     * @static
     * @param {IHttpBasedCredential} message HttpBasedCredential message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    HttpBasedCredential.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.token != null && Object.hasOwnProperty.call(message, "token"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.token);
        return writer;
    };

    /**
     * Encodes the specified HttpBasedCredential message, length delimited. Does not implicitly {@link HttpBasedCredential.verify|verify} messages.
     * @function encodeDelimited
     * @memberof HttpBasedCredential
     * @static
     * @param {IHttpBasedCredential} message HttpBasedCredential message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    HttpBasedCredential.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a HttpBasedCredential message from the specified reader or buffer.
     * @function decode
     * @memberof HttpBasedCredential
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {HttpBasedCredential} HttpBasedCredential
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    HttpBasedCredential.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.HttpBasedCredential();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.token = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a HttpBasedCredential message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof HttpBasedCredential
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {HttpBasedCredential} HttpBasedCredential
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    HttpBasedCredential.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a HttpBasedCredential message.
     * @function verify
     * @memberof HttpBasedCredential
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    HttpBasedCredential.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.token != null && message.hasOwnProperty("token"))
            if (!$util.isString(message.token))
                return "token: string expected";
        return null;
    };

    /**
     * Creates a HttpBasedCredential message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof HttpBasedCredential
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {HttpBasedCredential} HttpBasedCredential
     */
    HttpBasedCredential.fromObject = function fromObject(object) {
        if (object instanceof $root.HttpBasedCredential)
            return object;
        var message = new $root.HttpBasedCredential();
        if (object.token != null)
            message.token = String(object.token);
        return message;
    };

    /**
     * Creates a plain object from a HttpBasedCredential message. Also converts values to other types if specified.
     * @function toObject
     * @memberof HttpBasedCredential
     * @static
     * @param {HttpBasedCredential} message HttpBasedCredential
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    HttpBasedCredential.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults)
            object.token = "";
        if (message.token != null && message.hasOwnProperty("token"))
            object.token = message.token;
        return object;
    };

    /**
     * Converts this HttpBasedCredential to JSON.
     * @function toJSON
     * @memberof HttpBasedCredential
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    HttpBasedCredential.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return HttpBasedCredential;
})();

$root.HttpBasedVersionInfo = (function() {

    /**
     * Properties of a HttpBasedVersionInfo.
     * @exports IHttpBasedVersionInfo
     * @interface IHttpBasedVersionInfo
     * @property {HttpBasedVersionInfo.ServiceType|null} [serviceType] HttpBasedVersionInfo serviceType
     */

    /**
     * Constructs a new HttpBasedVersionInfo.
     * @exports HttpBasedVersionInfo
     * @classdesc Represents a HttpBasedVersionInfo.
     * @implements IHttpBasedVersionInfo
     * @constructor
     * @param {IHttpBasedVersionInfo=} [properties] Properties to set
     */
    function HttpBasedVersionInfo(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * HttpBasedVersionInfo serviceType.
     * @member {HttpBasedVersionInfo.ServiceType} serviceType
     * @memberof HttpBasedVersionInfo
     * @instance
     */
    HttpBasedVersionInfo.prototype.serviceType = 0;

    /**
     * Creates a new HttpBasedVersionInfo instance using the specified properties.
     * @function create
     * @memberof HttpBasedVersionInfo
     * @static
     * @param {IHttpBasedVersionInfo=} [properties] Properties to set
     * @returns {HttpBasedVersionInfo} HttpBasedVersionInfo instance
     */
    HttpBasedVersionInfo.create = function create(properties) {
        return new HttpBasedVersionInfo(properties);
    };

    /**
     * Encodes the specified HttpBasedVersionInfo message. Does not implicitly {@link HttpBasedVersionInfo.verify|verify} messages.
     * @function encode
     * @memberof HttpBasedVersionInfo
     * @static
     * @param {IHttpBasedVersionInfo} message HttpBasedVersionInfo message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    HttpBasedVersionInfo.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.serviceType != null && Object.hasOwnProperty.call(message, "serviceType"))
            writer.uint32(/* id 1, wireType 0 =*/8).int32(message.serviceType);
        return writer;
    };

    /**
     * Encodes the specified HttpBasedVersionInfo message, length delimited. Does not implicitly {@link HttpBasedVersionInfo.verify|verify} messages.
     * @function encodeDelimited
     * @memberof HttpBasedVersionInfo
     * @static
     * @param {IHttpBasedVersionInfo} message HttpBasedVersionInfo message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    HttpBasedVersionInfo.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a HttpBasedVersionInfo message from the specified reader or buffer.
     * @function decode
     * @memberof HttpBasedVersionInfo
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {HttpBasedVersionInfo} HttpBasedVersionInfo
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    HttpBasedVersionInfo.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.HttpBasedVersionInfo();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.serviceType = reader.int32();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a HttpBasedVersionInfo message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof HttpBasedVersionInfo
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {HttpBasedVersionInfo} HttpBasedVersionInfo
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    HttpBasedVersionInfo.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a HttpBasedVersionInfo message.
     * @function verify
     * @memberof HttpBasedVersionInfo
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    HttpBasedVersionInfo.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.serviceType != null && message.hasOwnProperty("serviceType"))
            switch (message.serviceType) {
            default:
                return "serviceType: enum value expected";
            case 0:
            case 1:
                break;
            }
        return null;
    };

    /**
     * Creates a HttpBasedVersionInfo message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof HttpBasedVersionInfo
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {HttpBasedVersionInfo} HttpBasedVersionInfo
     */
    HttpBasedVersionInfo.fromObject = function fromObject(object) {
        if (object instanceof $root.HttpBasedVersionInfo)
            return object;
        var message = new $root.HttpBasedVersionInfo();
        switch (object.serviceType) {
        case "FIREBASE":
        case 0:
            message.serviceType = 0;
            break;
        case "MOCK":
        case 1:
            message.serviceType = 1;
            break;
        }
        return message;
    };

    /**
     * Creates a plain object from a HttpBasedVersionInfo message. Also converts values to other types if specified.
     * @function toObject
     * @memberof HttpBasedVersionInfo
     * @static
     * @param {HttpBasedVersionInfo} message HttpBasedVersionInfo
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    HttpBasedVersionInfo.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults)
            object.serviceType = options.enums === String ? "FIREBASE" : 0;
        if (message.serviceType != null && message.hasOwnProperty("serviceType"))
            object.serviceType = options.enums === String ? $root.HttpBasedVersionInfo.ServiceType[message.serviceType] : message.serviceType;
        return object;
    };

    /**
     * Converts this HttpBasedVersionInfo to JSON.
     * @function toJSON
     * @memberof HttpBasedVersionInfo
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    HttpBasedVersionInfo.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    /**
     * ServiceType enum.
     * @name HttpBasedVersionInfo.ServiceType
     * @enum {number}
     * @property {number} FIREBASE=0 FIREBASE value
     * @property {number} MOCK=1 MOCK value
     */
    HttpBasedVersionInfo.ServiceType = (function() {
        var valuesById = {}, values = Object.create(valuesById);
        values[valuesById[0] = "FIREBASE"] = 0;
        values[valuesById[1] = "MOCK"] = 1;
        return values;
    })();

    return HttpBasedVersionInfo;
})();

$root.HttpBasedRequest = (function() {

    /**
     * Properties of a HttpBasedRequest.
     * @exports IHttpBasedRequest
     * @interface IHttpBasedRequest
     * @property {IHttpBasedCredential|null} [credential] HttpBasedRequest credential
     * @property {IHttpBasedVersionInfo|null} [versionInfo] HttpBasedRequest versionInfo
     * @property {ICreditCardCreationRequest|null} [creditCardCreationRequest] HttpBasedRequest creditCardCreationRequest
     * @property {ICreditCardUpdateRequest|null} [creditCardUpdateRequest] HttpBasedRequest creditCardUpdateRequest
     * @property {ICreditCardRemovalRequest|null} [creditCardRemovalRequest] HttpBasedRequest creditCardRemovalRequest
     * @property {IPromotionAdditionRequest|null} [promotionAdditionRequest] HttpBasedRequest promotionAdditionRequest
     * @property {IPromotionRemovalRequest|null} [promotionRemovalRequest] HttpBasedRequest promotionRemovalRequest
     * @property {IPromotionUpdateRequest|null} [promotionUpdateRequest] HttpBasedRequest promotionUpdateRequest
     */

    /**
     * Constructs a new HttpBasedRequest.
     * @exports HttpBasedRequest
     * @classdesc Represents a HttpBasedRequest.
     * @implements IHttpBasedRequest
     * @constructor
     * @param {IHttpBasedRequest=} [properties] Properties to set
     */
    function HttpBasedRequest(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * HttpBasedRequest credential.
     * @member {IHttpBasedCredential|null|undefined} credential
     * @memberof HttpBasedRequest
     * @instance
     */
    HttpBasedRequest.prototype.credential = null;

    /**
     * HttpBasedRequest versionInfo.
     * @member {IHttpBasedVersionInfo|null|undefined} versionInfo
     * @memberof HttpBasedRequest
     * @instance
     */
    HttpBasedRequest.prototype.versionInfo = null;

    /**
     * HttpBasedRequest creditCardCreationRequest.
     * @member {ICreditCardCreationRequest|null|undefined} creditCardCreationRequest
     * @memberof HttpBasedRequest
     * @instance
     */
    HttpBasedRequest.prototype.creditCardCreationRequest = null;

    /**
     * HttpBasedRequest creditCardUpdateRequest.
     * @member {ICreditCardUpdateRequest|null|undefined} creditCardUpdateRequest
     * @memberof HttpBasedRequest
     * @instance
     */
    HttpBasedRequest.prototype.creditCardUpdateRequest = null;

    /**
     * HttpBasedRequest creditCardRemovalRequest.
     * @member {ICreditCardRemovalRequest|null|undefined} creditCardRemovalRequest
     * @memberof HttpBasedRequest
     * @instance
     */
    HttpBasedRequest.prototype.creditCardRemovalRequest = null;

    /**
     * HttpBasedRequest promotionAdditionRequest.
     * @member {IPromotionAdditionRequest|null|undefined} promotionAdditionRequest
     * @memberof HttpBasedRequest
     * @instance
     */
    HttpBasedRequest.prototype.promotionAdditionRequest = null;

    /**
     * HttpBasedRequest promotionRemovalRequest.
     * @member {IPromotionRemovalRequest|null|undefined} promotionRemovalRequest
     * @memberof HttpBasedRequest
     * @instance
     */
    HttpBasedRequest.prototype.promotionRemovalRequest = null;

    /**
     * HttpBasedRequest promotionUpdateRequest.
     * @member {IPromotionUpdateRequest|null|undefined} promotionUpdateRequest
     * @memberof HttpBasedRequest
     * @instance
     */
    HttpBasedRequest.prototype.promotionUpdateRequest = null;

    // OneOf field names bound to virtual getters and setters
    var $oneOfFields;

    /**
     * HttpBasedRequest request.
     * @member {"creditCardCreationRequest"|"creditCardUpdateRequest"|"creditCardRemovalRequest"|"promotionAdditionRequest"|"promotionRemovalRequest"|"promotionUpdateRequest"|undefined} request
     * @memberof HttpBasedRequest
     * @instance
     */
    Object.defineProperty(HttpBasedRequest.prototype, "request", {
        get: $util.oneOfGetter($oneOfFields = ["creditCardCreationRequest", "creditCardUpdateRequest", "creditCardRemovalRequest", "promotionAdditionRequest", "promotionRemovalRequest", "promotionUpdateRequest"]),
        set: $util.oneOfSetter($oneOfFields)
    });

    /**
     * Creates a new HttpBasedRequest instance using the specified properties.
     * @function create
     * @memberof HttpBasedRequest
     * @static
     * @param {IHttpBasedRequest=} [properties] Properties to set
     * @returns {HttpBasedRequest} HttpBasedRequest instance
     */
    HttpBasedRequest.create = function create(properties) {
        return new HttpBasedRequest(properties);
    };

    /**
     * Encodes the specified HttpBasedRequest message. Does not implicitly {@link HttpBasedRequest.verify|verify} messages.
     * @function encode
     * @memberof HttpBasedRequest
     * @static
     * @param {IHttpBasedRequest} message HttpBasedRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    HttpBasedRequest.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.credential != null && Object.hasOwnProperty.call(message, "credential"))
            $root.HttpBasedCredential.encode(message.credential, writer.uint32(/* id 1, wireType 2 =*/10).fork()).ldelim();
        if (message.versionInfo != null && Object.hasOwnProperty.call(message, "versionInfo"))
            $root.HttpBasedVersionInfo.encode(message.versionInfo, writer.uint32(/* id 2, wireType 2 =*/18).fork()).ldelim();
        if (message.creditCardCreationRequest != null && Object.hasOwnProperty.call(message, "creditCardCreationRequest"))
            $root.CreditCardCreationRequest.encode(message.creditCardCreationRequest, writer.uint32(/* id 3, wireType 2 =*/26).fork()).ldelim();
        if (message.creditCardUpdateRequest != null && Object.hasOwnProperty.call(message, "creditCardUpdateRequest"))
            $root.CreditCardUpdateRequest.encode(message.creditCardUpdateRequest, writer.uint32(/* id 4, wireType 2 =*/34).fork()).ldelim();
        if (message.creditCardRemovalRequest != null && Object.hasOwnProperty.call(message, "creditCardRemovalRequest"))
            $root.CreditCardRemovalRequest.encode(message.creditCardRemovalRequest, writer.uint32(/* id 5, wireType 2 =*/42).fork()).ldelim();
        if (message.promotionAdditionRequest != null && Object.hasOwnProperty.call(message, "promotionAdditionRequest"))
            $root.PromotionAdditionRequest.encode(message.promotionAdditionRequest, writer.uint32(/* id 6, wireType 2 =*/50).fork()).ldelim();
        if (message.promotionRemovalRequest != null && Object.hasOwnProperty.call(message, "promotionRemovalRequest"))
            $root.PromotionRemovalRequest.encode(message.promotionRemovalRequest, writer.uint32(/* id 7, wireType 2 =*/58).fork()).ldelim();
        if (message.promotionUpdateRequest != null && Object.hasOwnProperty.call(message, "promotionUpdateRequest"))
            $root.PromotionUpdateRequest.encode(message.promotionUpdateRequest, writer.uint32(/* id 8, wireType 2 =*/66).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified HttpBasedRequest message, length delimited. Does not implicitly {@link HttpBasedRequest.verify|verify} messages.
     * @function encodeDelimited
     * @memberof HttpBasedRequest
     * @static
     * @param {IHttpBasedRequest} message HttpBasedRequest message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    HttpBasedRequest.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a HttpBasedRequest message from the specified reader or buffer.
     * @function decode
     * @memberof HttpBasedRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {HttpBasedRequest} HttpBasedRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    HttpBasedRequest.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.HttpBasedRequest();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.credential = $root.HttpBasedCredential.decode(reader, reader.uint32());
                break;
            case 2:
                message.versionInfo = $root.HttpBasedVersionInfo.decode(reader, reader.uint32());
                break;
            case 3:
                message.creditCardCreationRequest = $root.CreditCardCreationRequest.decode(reader, reader.uint32());
                break;
            case 4:
                message.creditCardUpdateRequest = $root.CreditCardUpdateRequest.decode(reader, reader.uint32());
                break;
            case 5:
                message.creditCardRemovalRequest = $root.CreditCardRemovalRequest.decode(reader, reader.uint32());
                break;
            case 6:
                message.promotionAdditionRequest = $root.PromotionAdditionRequest.decode(reader, reader.uint32());
                break;
            case 7:
                message.promotionRemovalRequest = $root.PromotionRemovalRequest.decode(reader, reader.uint32());
                break;
            case 8:
                message.promotionUpdateRequest = $root.PromotionUpdateRequest.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a HttpBasedRequest message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof HttpBasedRequest
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {HttpBasedRequest} HttpBasedRequest
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    HttpBasedRequest.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a HttpBasedRequest message.
     * @function verify
     * @memberof HttpBasedRequest
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    HttpBasedRequest.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        var properties = {};
        if (message.credential != null && message.hasOwnProperty("credential")) {
            var error = $root.HttpBasedCredential.verify(message.credential);
            if (error)
                return "credential." + error;
        }
        if (message.versionInfo != null && message.hasOwnProperty("versionInfo")) {
            var error = $root.HttpBasedVersionInfo.verify(message.versionInfo);
            if (error)
                return "versionInfo." + error;
        }
        if (message.creditCardCreationRequest != null && message.hasOwnProperty("creditCardCreationRequest")) {
            properties.request = 1;
            {
                var error = $root.CreditCardCreationRequest.verify(message.creditCardCreationRequest);
                if (error)
                    return "creditCardCreationRequest." + error;
            }
        }
        if (message.creditCardUpdateRequest != null && message.hasOwnProperty("creditCardUpdateRequest")) {
            if (properties.request === 1)
                return "request: multiple values";
            properties.request = 1;
            {
                var error = $root.CreditCardUpdateRequest.verify(message.creditCardUpdateRequest);
                if (error)
                    return "creditCardUpdateRequest." + error;
            }
        }
        if (message.creditCardRemovalRequest != null && message.hasOwnProperty("creditCardRemovalRequest")) {
            if (properties.request === 1)
                return "request: multiple values";
            properties.request = 1;
            {
                var error = $root.CreditCardRemovalRequest.verify(message.creditCardRemovalRequest);
                if (error)
                    return "creditCardRemovalRequest." + error;
            }
        }
        if (message.promotionAdditionRequest != null && message.hasOwnProperty("promotionAdditionRequest")) {
            if (properties.request === 1)
                return "request: multiple values";
            properties.request = 1;
            {
                var error = $root.PromotionAdditionRequest.verify(message.promotionAdditionRequest);
                if (error)
                    return "promotionAdditionRequest." + error;
            }
        }
        if (message.promotionRemovalRequest != null && message.hasOwnProperty("promotionRemovalRequest")) {
            if (properties.request === 1)
                return "request: multiple values";
            properties.request = 1;
            {
                var error = $root.PromotionRemovalRequest.verify(message.promotionRemovalRequest);
                if (error)
                    return "promotionRemovalRequest." + error;
            }
        }
        if (message.promotionUpdateRequest != null && message.hasOwnProperty("promotionUpdateRequest")) {
            if (properties.request === 1)
                return "request: multiple values";
            properties.request = 1;
            {
                var error = $root.PromotionUpdateRequest.verify(message.promotionUpdateRequest);
                if (error)
                    return "promotionUpdateRequest." + error;
            }
        }
        return null;
    };

    /**
     * Creates a HttpBasedRequest message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof HttpBasedRequest
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {HttpBasedRequest} HttpBasedRequest
     */
    HttpBasedRequest.fromObject = function fromObject(object) {
        if (object instanceof $root.HttpBasedRequest)
            return object;
        var message = new $root.HttpBasedRequest();
        if (object.credential != null) {
            if (typeof object.credential !== "object")
                throw TypeError(".HttpBasedRequest.credential: object expected");
            message.credential = $root.HttpBasedCredential.fromObject(object.credential);
        }
        if (object.versionInfo != null) {
            if (typeof object.versionInfo !== "object")
                throw TypeError(".HttpBasedRequest.versionInfo: object expected");
            message.versionInfo = $root.HttpBasedVersionInfo.fromObject(object.versionInfo);
        }
        if (object.creditCardCreationRequest != null) {
            if (typeof object.creditCardCreationRequest !== "object")
                throw TypeError(".HttpBasedRequest.creditCardCreationRequest: object expected");
            message.creditCardCreationRequest = $root.CreditCardCreationRequest.fromObject(object.creditCardCreationRequest);
        }
        if (object.creditCardUpdateRequest != null) {
            if (typeof object.creditCardUpdateRequest !== "object")
                throw TypeError(".HttpBasedRequest.creditCardUpdateRequest: object expected");
            message.creditCardUpdateRequest = $root.CreditCardUpdateRequest.fromObject(object.creditCardUpdateRequest);
        }
        if (object.creditCardRemovalRequest != null) {
            if (typeof object.creditCardRemovalRequest !== "object")
                throw TypeError(".HttpBasedRequest.creditCardRemovalRequest: object expected");
            message.creditCardRemovalRequest = $root.CreditCardRemovalRequest.fromObject(object.creditCardRemovalRequest);
        }
        if (object.promotionAdditionRequest != null) {
            if (typeof object.promotionAdditionRequest !== "object")
                throw TypeError(".HttpBasedRequest.promotionAdditionRequest: object expected");
            message.promotionAdditionRequest = $root.PromotionAdditionRequest.fromObject(object.promotionAdditionRequest);
        }
        if (object.promotionRemovalRequest != null) {
            if (typeof object.promotionRemovalRequest !== "object")
                throw TypeError(".HttpBasedRequest.promotionRemovalRequest: object expected");
            message.promotionRemovalRequest = $root.PromotionRemovalRequest.fromObject(object.promotionRemovalRequest);
        }
        if (object.promotionUpdateRequest != null) {
            if (typeof object.promotionUpdateRequest !== "object")
                throw TypeError(".HttpBasedRequest.promotionUpdateRequest: object expected");
            message.promotionUpdateRequest = $root.PromotionUpdateRequest.fromObject(object.promotionUpdateRequest);
        }
        return message;
    };

    /**
     * Creates a plain object from a HttpBasedRequest message. Also converts values to other types if specified.
     * @function toObject
     * @memberof HttpBasedRequest
     * @static
     * @param {HttpBasedRequest} message HttpBasedRequest
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    HttpBasedRequest.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.credential = null;
            object.versionInfo = null;
        }
        if (message.credential != null && message.hasOwnProperty("credential"))
            object.credential = $root.HttpBasedCredential.toObject(message.credential, options);
        if (message.versionInfo != null && message.hasOwnProperty("versionInfo"))
            object.versionInfo = $root.HttpBasedVersionInfo.toObject(message.versionInfo, options);
        if (message.creditCardCreationRequest != null && message.hasOwnProperty("creditCardCreationRequest")) {
            object.creditCardCreationRequest = $root.CreditCardCreationRequest.toObject(message.creditCardCreationRequest, options);
            if (options.oneofs)
                object.request = "creditCardCreationRequest";
        }
        if (message.creditCardUpdateRequest != null && message.hasOwnProperty("creditCardUpdateRequest")) {
            object.creditCardUpdateRequest = $root.CreditCardUpdateRequest.toObject(message.creditCardUpdateRequest, options);
            if (options.oneofs)
                object.request = "creditCardUpdateRequest";
        }
        if (message.creditCardRemovalRequest != null && message.hasOwnProperty("creditCardRemovalRequest")) {
            object.creditCardRemovalRequest = $root.CreditCardRemovalRequest.toObject(message.creditCardRemovalRequest, options);
            if (options.oneofs)
                object.request = "creditCardRemovalRequest";
        }
        if (message.promotionAdditionRequest != null && message.hasOwnProperty("promotionAdditionRequest")) {
            object.promotionAdditionRequest = $root.PromotionAdditionRequest.toObject(message.promotionAdditionRequest, options);
            if (options.oneofs)
                object.request = "promotionAdditionRequest";
        }
        if (message.promotionRemovalRequest != null && message.hasOwnProperty("promotionRemovalRequest")) {
            object.promotionRemovalRequest = $root.PromotionRemovalRequest.toObject(message.promotionRemovalRequest, options);
            if (options.oneofs)
                object.request = "promotionRemovalRequest";
        }
        if (message.promotionUpdateRequest != null && message.hasOwnProperty("promotionUpdateRequest")) {
            object.promotionUpdateRequest = $root.PromotionUpdateRequest.toObject(message.promotionUpdateRequest, options);
            if (options.oneofs)
                object.request = "promotionUpdateRequest";
        }
        return object;
    };

    /**
     * Converts this HttpBasedRequest to JSON.
     * @function toJSON
     * @memberof HttpBasedRequest
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    HttpBasedRequest.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return HttpBasedRequest;
})();

$root.GetCreditCardResponse = (function() {

    /**
     * Properties of a GetCreditCardResponse.
     * @exports IGetCreditCardResponse
     * @interface IGetCreditCardResponse
     * @property {Array.<ICreditCard>|null} [cards] GetCreditCardResponse cards
     */

    /**
     * Constructs a new GetCreditCardResponse.
     * @exports GetCreditCardResponse
     * @classdesc Represents a GetCreditCardResponse.
     * @implements IGetCreditCardResponse
     * @constructor
     * @param {IGetCreditCardResponse=} [properties] Properties to set
     */
    function GetCreditCardResponse(properties) {
        this.cards = [];
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * GetCreditCardResponse cards.
     * @member {Array.<ICreditCard>} cards
     * @memberof GetCreditCardResponse
     * @instance
     */
    GetCreditCardResponse.prototype.cards = $util.emptyArray;

    /**
     * Creates a new GetCreditCardResponse instance using the specified properties.
     * @function create
     * @memberof GetCreditCardResponse
     * @static
     * @param {IGetCreditCardResponse=} [properties] Properties to set
     * @returns {GetCreditCardResponse} GetCreditCardResponse instance
     */
    GetCreditCardResponse.create = function create(properties) {
        return new GetCreditCardResponse(properties);
    };

    /**
     * Encodes the specified GetCreditCardResponse message. Does not implicitly {@link GetCreditCardResponse.verify|verify} messages.
     * @function encode
     * @memberof GetCreditCardResponse
     * @static
     * @param {IGetCreditCardResponse} message GetCreditCardResponse message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    GetCreditCardResponse.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.cards != null && message.cards.length)
            for (var i = 0; i < message.cards.length; ++i)
                $root.CreditCard.encode(message.cards[i], writer.uint32(/* id 1, wireType 2 =*/10).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified GetCreditCardResponse message, length delimited. Does not implicitly {@link GetCreditCardResponse.verify|verify} messages.
     * @function encodeDelimited
     * @memberof GetCreditCardResponse
     * @static
     * @param {IGetCreditCardResponse} message GetCreditCardResponse message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    GetCreditCardResponse.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a GetCreditCardResponse message from the specified reader or buffer.
     * @function decode
     * @memberof GetCreditCardResponse
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {GetCreditCardResponse} GetCreditCardResponse
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    GetCreditCardResponse.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.GetCreditCardResponse();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                if (!(message.cards && message.cards.length))
                    message.cards = [];
                message.cards.push($root.CreditCard.decode(reader, reader.uint32()));
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a GetCreditCardResponse message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof GetCreditCardResponse
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {GetCreditCardResponse} GetCreditCardResponse
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    GetCreditCardResponse.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a GetCreditCardResponse message.
     * @function verify
     * @memberof GetCreditCardResponse
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    GetCreditCardResponse.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.cards != null && message.hasOwnProperty("cards")) {
            if (!Array.isArray(message.cards))
                return "cards: array expected";
            for (var i = 0; i < message.cards.length; ++i) {
                var error = $root.CreditCard.verify(message.cards[i]);
                if (error)
                    return "cards." + error;
            }
        }
        return null;
    };

    /**
     * Creates a GetCreditCardResponse message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof GetCreditCardResponse
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {GetCreditCardResponse} GetCreditCardResponse
     */
    GetCreditCardResponse.fromObject = function fromObject(object) {
        if (object instanceof $root.GetCreditCardResponse)
            return object;
        var message = new $root.GetCreditCardResponse();
        if (object.cards) {
            if (!Array.isArray(object.cards))
                throw TypeError(".GetCreditCardResponse.cards: array expected");
            message.cards = [];
            for (var i = 0; i < object.cards.length; ++i) {
                if (typeof object.cards[i] !== "object")
                    throw TypeError(".GetCreditCardResponse.cards: object expected");
                message.cards[i] = $root.CreditCard.fromObject(object.cards[i]);
            }
        }
        return message;
    };

    /**
     * Creates a plain object from a GetCreditCardResponse message. Also converts values to other types if specified.
     * @function toObject
     * @memberof GetCreditCardResponse
     * @static
     * @param {GetCreditCardResponse} message GetCreditCardResponse
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    GetCreditCardResponse.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.arrays || options.defaults)
            object.cards = [];
        if (message.cards && message.cards.length) {
            object.cards = [];
            for (var j = 0; j < message.cards.length; ++j)
                object.cards[j] = $root.CreditCard.toObject(message.cards[j], options);
        }
        return object;
    };

    /**
     * Converts this GetCreditCardResponse to JSON.
     * @function toJSON
     * @memberof GetCreditCardResponse
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    GetCreditCardResponse.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return GetCreditCardResponse;
})();

$root.GenericResponse = (function() {

    /**
     * Properties of a GenericResponse.
     * @exports IGenericResponse
     * @interface IGenericResponse
     * @property {string|null} [msg] GenericResponse msg
     */

    /**
     * Constructs a new GenericResponse.
     * @exports GenericResponse
     * @classdesc Represents a GenericResponse.
     * @implements IGenericResponse
     * @constructor
     * @param {IGenericResponse=} [properties] Properties to set
     */
    function GenericResponse(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * GenericResponse msg.
     * @member {string} msg
     * @memberof GenericResponse
     * @instance
     */
    GenericResponse.prototype.msg = "";

    /**
     * Creates a new GenericResponse instance using the specified properties.
     * @function create
     * @memberof GenericResponse
     * @static
     * @param {IGenericResponse=} [properties] Properties to set
     * @returns {GenericResponse} GenericResponse instance
     */
    GenericResponse.create = function create(properties) {
        return new GenericResponse(properties);
    };

    /**
     * Encodes the specified GenericResponse message. Does not implicitly {@link GenericResponse.verify|verify} messages.
     * @function encode
     * @memberof GenericResponse
     * @static
     * @param {IGenericResponse} message GenericResponse message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    GenericResponse.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.msg != null && Object.hasOwnProperty.call(message, "msg"))
            writer.uint32(/* id 1, wireType 2 =*/10).string(message.msg);
        return writer;
    };

    /**
     * Encodes the specified GenericResponse message, length delimited. Does not implicitly {@link GenericResponse.verify|verify} messages.
     * @function encodeDelimited
     * @memberof GenericResponse
     * @static
     * @param {IGenericResponse} message GenericResponse message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    GenericResponse.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a GenericResponse message from the specified reader or buffer.
     * @function decode
     * @memberof GenericResponse
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {GenericResponse} GenericResponse
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    GenericResponse.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.GenericResponse();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.msg = reader.string();
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a GenericResponse message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof GenericResponse
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {GenericResponse} GenericResponse
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    GenericResponse.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a GenericResponse message.
     * @function verify
     * @memberof GenericResponse
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    GenericResponse.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        if (message.msg != null && message.hasOwnProperty("msg"))
            if (!$util.isString(message.msg))
                return "msg: string expected";
        return null;
    };

    /**
     * Creates a GenericResponse message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof GenericResponse
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {GenericResponse} GenericResponse
     */
    GenericResponse.fromObject = function fromObject(object) {
        if (object instanceof $root.GenericResponse)
            return object;
        var message = new $root.GenericResponse();
        if (object.msg != null)
            message.msg = String(object.msg);
        return message;
    };

    /**
     * Creates a plain object from a GenericResponse message. Also converts values to other types if specified.
     * @function toObject
     * @memberof GenericResponse
     * @static
     * @param {GenericResponse} message GenericResponse
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    GenericResponse.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults)
            object.msg = "";
        if (message.msg != null && message.hasOwnProperty("msg"))
            object.msg = message.msg;
        return object;
    };

    /**
     * Converts this GenericResponse to JSON.
     * @function toJSON
     * @memberof GenericResponse
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    GenericResponse.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    return GenericResponse;
})();

$root.HttpBasedResponse = (function() {

    /**
     * Properties of a HttpBasedResponse.
     * @exports IHttpBasedResponse
     * @interface IHttpBasedResponse
     * @property {HttpBasedResponse.Status|null} [status] HttpBasedResponse status
     * @property {number|null} [statusCode] HttpBasedResponse statusCode
     * @property {HttpBasedResponse.IError|null} [error] HttpBasedResponse error
     * @property {IGenericResponse|null} [genericResponse] HttpBasedResponse genericResponse
     * @property {IGetCreditCardResponse|null} [getCreditCardResponse] HttpBasedResponse getCreditCardResponse
     */

    /**
     * Constructs a new HttpBasedResponse.
     * @exports HttpBasedResponse
     * @classdesc Represents a HttpBasedResponse.
     * @implements IHttpBasedResponse
     * @constructor
     * @param {IHttpBasedResponse=} [properties] Properties to set
     */
    function HttpBasedResponse(properties) {
        if (properties)
            for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                if (properties[keys[i]] != null)
                    this[keys[i]] = properties[keys[i]];
    }

    /**
     * HttpBasedResponse status.
     * @member {HttpBasedResponse.Status} status
     * @memberof HttpBasedResponse
     * @instance
     */
    HttpBasedResponse.prototype.status = 0;

    /**
     * HttpBasedResponse statusCode.
     * @member {number} statusCode
     * @memberof HttpBasedResponse
     * @instance
     */
    HttpBasedResponse.prototype.statusCode = 0;

    /**
     * HttpBasedResponse error.
     * @member {HttpBasedResponse.IError|null|undefined} error
     * @memberof HttpBasedResponse
     * @instance
     */
    HttpBasedResponse.prototype.error = null;

    /**
     * HttpBasedResponse genericResponse.
     * @member {IGenericResponse|null|undefined} genericResponse
     * @memberof HttpBasedResponse
     * @instance
     */
    HttpBasedResponse.prototype.genericResponse = null;

    /**
     * HttpBasedResponse getCreditCardResponse.
     * @member {IGetCreditCardResponse|null|undefined} getCreditCardResponse
     * @memberof HttpBasedResponse
     * @instance
     */
    HttpBasedResponse.prototype.getCreditCardResponse = null;

    // OneOf field names bound to virtual getters and setters
    var $oneOfFields;

    /**
     * HttpBasedResponse response.
     * @member {"genericResponse"|"getCreditCardResponse"|undefined} response
     * @memberof HttpBasedResponse
     * @instance
     */
    Object.defineProperty(HttpBasedResponse.prototype, "response", {
        get: $util.oneOfGetter($oneOfFields = ["genericResponse", "getCreditCardResponse"]),
        set: $util.oneOfSetter($oneOfFields)
    });

    /**
     * Creates a new HttpBasedResponse instance using the specified properties.
     * @function create
     * @memberof HttpBasedResponse
     * @static
     * @param {IHttpBasedResponse=} [properties] Properties to set
     * @returns {HttpBasedResponse} HttpBasedResponse instance
     */
    HttpBasedResponse.create = function create(properties) {
        return new HttpBasedResponse(properties);
    };

    /**
     * Encodes the specified HttpBasedResponse message. Does not implicitly {@link HttpBasedResponse.verify|verify} messages.
     * @function encode
     * @memberof HttpBasedResponse
     * @static
     * @param {IHttpBasedResponse} message HttpBasedResponse message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    HttpBasedResponse.encode = function encode(message, writer) {
        if (!writer)
            writer = $Writer.create();
        if (message.status != null && Object.hasOwnProperty.call(message, "status"))
            writer.uint32(/* id 1, wireType 0 =*/8).int32(message.status);
        if (message.statusCode != null && Object.hasOwnProperty.call(message, "statusCode"))
            writer.uint32(/* id 2, wireType 0 =*/16).int32(message.statusCode);
        if (message.error != null && Object.hasOwnProperty.call(message, "error"))
            $root.HttpBasedResponse.Error.encode(message.error, writer.uint32(/* id 3, wireType 2 =*/26).fork()).ldelim();
        if (message.genericResponse != null && Object.hasOwnProperty.call(message, "genericResponse"))
            $root.GenericResponse.encode(message.genericResponse, writer.uint32(/* id 4, wireType 2 =*/34).fork()).ldelim();
        if (message.getCreditCardResponse != null && Object.hasOwnProperty.call(message, "getCreditCardResponse"))
            $root.GetCreditCardResponse.encode(message.getCreditCardResponse, writer.uint32(/* id 5, wireType 2 =*/42).fork()).ldelim();
        return writer;
    };

    /**
     * Encodes the specified HttpBasedResponse message, length delimited. Does not implicitly {@link HttpBasedResponse.verify|verify} messages.
     * @function encodeDelimited
     * @memberof HttpBasedResponse
     * @static
     * @param {IHttpBasedResponse} message HttpBasedResponse message or plain object to encode
     * @param {$protobuf.Writer} [writer] Writer to encode to
     * @returns {$protobuf.Writer} Writer
     */
    HttpBasedResponse.encodeDelimited = function encodeDelimited(message, writer) {
        return this.encode(message, writer).ldelim();
    };

    /**
     * Decodes a HttpBasedResponse message from the specified reader or buffer.
     * @function decode
     * @memberof HttpBasedResponse
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @param {number} [length] Message length if known beforehand
     * @returns {HttpBasedResponse} HttpBasedResponse
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    HttpBasedResponse.decode = function decode(reader, length) {
        if (!(reader instanceof $Reader))
            reader = $Reader.create(reader);
        var end = length === undefined ? reader.len : reader.pos + length, message = new $root.HttpBasedResponse();
        while (reader.pos < end) {
            var tag = reader.uint32();
            switch (tag >>> 3) {
            case 1:
                message.status = reader.int32();
                break;
            case 2:
                message.statusCode = reader.int32();
                break;
            case 3:
                message.error = $root.HttpBasedResponse.Error.decode(reader, reader.uint32());
                break;
            case 4:
                message.genericResponse = $root.GenericResponse.decode(reader, reader.uint32());
                break;
            case 5:
                message.getCreditCardResponse = $root.GetCreditCardResponse.decode(reader, reader.uint32());
                break;
            default:
                reader.skipType(tag & 7);
                break;
            }
        }
        return message;
    };

    /**
     * Decodes a HttpBasedResponse message from the specified reader or buffer, length delimited.
     * @function decodeDelimited
     * @memberof HttpBasedResponse
     * @static
     * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
     * @returns {HttpBasedResponse} HttpBasedResponse
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    HttpBasedResponse.decodeDelimited = function decodeDelimited(reader) {
        if (!(reader instanceof $Reader))
            reader = new $Reader(reader);
        return this.decode(reader, reader.uint32());
    };

    /**
     * Verifies a HttpBasedResponse message.
     * @function verify
     * @memberof HttpBasedResponse
     * @static
     * @param {Object.<string,*>} message Plain object to verify
     * @returns {string|null} `null` if valid, otherwise the reason why it is not
     */
    HttpBasedResponse.verify = function verify(message) {
        if (typeof message !== "object" || message === null)
            return "object expected";
        var properties = {};
        if (message.status != null && message.hasOwnProperty("status"))
            switch (message.status) {
            default:
                return "status: enum value expected";
            case 0:
            case 1:
            case 2:
                break;
            }
        if (message.statusCode != null && message.hasOwnProperty("statusCode"))
            if (!$util.isInteger(message.statusCode))
                return "statusCode: integer expected";
        if (message.error != null && message.hasOwnProperty("error")) {
            var error = $root.HttpBasedResponse.Error.verify(message.error);
            if (error)
                return "error." + error;
        }
        if (message.genericResponse != null && message.hasOwnProperty("genericResponse")) {
            properties.response = 1;
            {
                var error = $root.GenericResponse.verify(message.genericResponse);
                if (error)
                    return "genericResponse." + error;
            }
        }
        if (message.getCreditCardResponse != null && message.hasOwnProperty("getCreditCardResponse")) {
            if (properties.response === 1)
                return "response: multiple values";
            properties.response = 1;
            {
                var error = $root.GetCreditCardResponse.verify(message.getCreditCardResponse);
                if (error)
                    return "getCreditCardResponse." + error;
            }
        }
        return null;
    };

    /**
     * Creates a HttpBasedResponse message from a plain object. Also converts values to their respective internal types.
     * @function fromObject
     * @memberof HttpBasedResponse
     * @static
     * @param {Object.<string,*>} object Plain object
     * @returns {HttpBasedResponse} HttpBasedResponse
     */
    HttpBasedResponse.fromObject = function fromObject(object) {
        if (object instanceof $root.HttpBasedResponse)
            return object;
        var message = new $root.HttpBasedResponse();
        switch (object.status) {
        case "SUCCESS":
        case 0:
            message.status = 0;
            break;
        case "ERROR":
        case 1:
            message.status = 1;
            break;
        case "UNKNOWN":
        case 2:
            message.status = 2;
            break;
        }
        if (object.statusCode != null)
            message.statusCode = object.statusCode | 0;
        if (object.error != null) {
            if (typeof object.error !== "object")
                throw TypeError(".HttpBasedResponse.error: object expected");
            message.error = $root.HttpBasedResponse.Error.fromObject(object.error);
        }
        if (object.genericResponse != null) {
            if (typeof object.genericResponse !== "object")
                throw TypeError(".HttpBasedResponse.genericResponse: object expected");
            message.genericResponse = $root.GenericResponse.fromObject(object.genericResponse);
        }
        if (object.getCreditCardResponse != null) {
            if (typeof object.getCreditCardResponse !== "object")
                throw TypeError(".HttpBasedResponse.getCreditCardResponse: object expected");
            message.getCreditCardResponse = $root.GetCreditCardResponse.fromObject(object.getCreditCardResponse);
        }
        return message;
    };

    /**
     * Creates a plain object from a HttpBasedResponse message. Also converts values to other types if specified.
     * @function toObject
     * @memberof HttpBasedResponse
     * @static
     * @param {HttpBasedResponse} message HttpBasedResponse
     * @param {$protobuf.IConversionOptions} [options] Conversion options
     * @returns {Object.<string,*>} Plain object
     */
    HttpBasedResponse.toObject = function toObject(message, options) {
        if (!options)
            options = {};
        var object = {};
        if (options.defaults) {
            object.status = options.enums === String ? "SUCCESS" : 0;
            object.statusCode = 0;
            object.error = null;
        }
        if (message.status != null && message.hasOwnProperty("status"))
            object.status = options.enums === String ? $root.HttpBasedResponse.Status[message.status] : message.status;
        if (message.statusCode != null && message.hasOwnProperty("statusCode"))
            object.statusCode = message.statusCode;
        if (message.error != null && message.hasOwnProperty("error"))
            object.error = $root.HttpBasedResponse.Error.toObject(message.error, options);
        if (message.genericResponse != null && message.hasOwnProperty("genericResponse")) {
            object.genericResponse = $root.GenericResponse.toObject(message.genericResponse, options);
            if (options.oneofs)
                object.response = "genericResponse";
        }
        if (message.getCreditCardResponse != null && message.hasOwnProperty("getCreditCardResponse")) {
            object.getCreditCardResponse = $root.GetCreditCardResponse.toObject(message.getCreditCardResponse, options);
            if (options.oneofs)
                object.response = "getCreditCardResponse";
        }
        return object;
    };

    /**
     * Converts this HttpBasedResponse to JSON.
     * @function toJSON
     * @memberof HttpBasedResponse
     * @instance
     * @returns {Object.<string,*>} JSON object
     */
    HttpBasedResponse.prototype.toJSON = function toJSON() {
        return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
    };

    /**
     * Status enum.
     * @name HttpBasedResponse.Status
     * @enum {number}
     * @property {number} SUCCESS=0 SUCCESS value
     * @property {number} ERROR=1 ERROR value
     * @property {number} UNKNOWN=2 UNKNOWN value
     */
    HttpBasedResponse.Status = (function() {
        var valuesById = {}, values = Object.create(valuesById);
        values[valuesById[0] = "SUCCESS"] = 0;
        values[valuesById[1] = "ERROR"] = 1;
        values[valuesById[2] = "UNKNOWN"] = 2;
        return values;
    })();

    HttpBasedResponse.Error = (function() {

        /**
         * Properties of an Error.
         * @memberof HttpBasedResponse
         * @interface IError
         * @property {string|null} [title] Error title
         * @property {string|null} [detail] Error detail
         */

        /**
         * Constructs a new Error.
         * @memberof HttpBasedResponse
         * @classdesc Represents an Error.
         * @implements IError
         * @constructor
         * @param {HttpBasedResponse.IError=} [properties] Properties to set
         */
        function Error(properties) {
            if (properties)
                for (var keys = Object.keys(properties), i = 0; i < keys.length; ++i)
                    if (properties[keys[i]] != null)
                        this[keys[i]] = properties[keys[i]];
        }

        /**
         * Error title.
         * @member {string} title
         * @memberof HttpBasedResponse.Error
         * @instance
         */
        Error.prototype.title = "";

        /**
         * Error detail.
         * @member {string} detail
         * @memberof HttpBasedResponse.Error
         * @instance
         */
        Error.prototype.detail = "";

        /**
         * Creates a new Error instance using the specified properties.
         * @function create
         * @memberof HttpBasedResponse.Error
         * @static
         * @param {HttpBasedResponse.IError=} [properties] Properties to set
         * @returns {HttpBasedResponse.Error} Error instance
         */
        Error.create = function create(properties) {
            return new Error(properties);
        };

        /**
         * Encodes the specified Error message. Does not implicitly {@link HttpBasedResponse.Error.verify|verify} messages.
         * @function encode
         * @memberof HttpBasedResponse.Error
         * @static
         * @param {HttpBasedResponse.IError} message Error message or plain object to encode
         * @param {$protobuf.Writer} [writer] Writer to encode to
         * @returns {$protobuf.Writer} Writer
         */
        Error.encode = function encode(message, writer) {
            if (!writer)
                writer = $Writer.create();
            if (message.title != null && Object.hasOwnProperty.call(message, "title"))
                writer.uint32(/* id 1, wireType 2 =*/10).string(message.title);
            if (message.detail != null && Object.hasOwnProperty.call(message, "detail"))
                writer.uint32(/* id 2, wireType 2 =*/18).string(message.detail);
            return writer;
        };

        /**
         * Encodes the specified Error message, length delimited. Does not implicitly {@link HttpBasedResponse.Error.verify|verify} messages.
         * @function encodeDelimited
         * @memberof HttpBasedResponse.Error
         * @static
         * @param {HttpBasedResponse.IError} message Error message or plain object to encode
         * @param {$protobuf.Writer} [writer] Writer to encode to
         * @returns {$protobuf.Writer} Writer
         */
        Error.encodeDelimited = function encodeDelimited(message, writer) {
            return this.encode(message, writer).ldelim();
        };

        /**
         * Decodes an Error message from the specified reader or buffer.
         * @function decode
         * @memberof HttpBasedResponse.Error
         * @static
         * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
         * @param {number} [length] Message length if known beforehand
         * @returns {HttpBasedResponse.Error} Error
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        Error.decode = function decode(reader, length) {
            if (!(reader instanceof $Reader))
                reader = $Reader.create(reader);
            var end = length === undefined ? reader.len : reader.pos + length, message = new $root.HttpBasedResponse.Error();
            while (reader.pos < end) {
                var tag = reader.uint32();
                switch (tag >>> 3) {
                case 1:
                    message.title = reader.string();
                    break;
                case 2:
                    message.detail = reader.string();
                    break;
                default:
                    reader.skipType(tag & 7);
                    break;
                }
            }
            return message;
        };

        /**
         * Decodes an Error message from the specified reader or buffer, length delimited.
         * @function decodeDelimited
         * @memberof HttpBasedResponse.Error
         * @static
         * @param {$protobuf.Reader|Uint8Array} reader Reader or buffer to decode from
         * @returns {HttpBasedResponse.Error} Error
         * @throws {Error} If the payload is not a reader or valid buffer
         * @throws {$protobuf.util.ProtocolError} If required fields are missing
         */
        Error.decodeDelimited = function decodeDelimited(reader) {
            if (!(reader instanceof $Reader))
                reader = new $Reader(reader);
            return this.decode(reader, reader.uint32());
        };

        /**
         * Verifies an Error message.
         * @function verify
         * @memberof HttpBasedResponse.Error
         * @static
         * @param {Object.<string,*>} message Plain object to verify
         * @returns {string|null} `null` if valid, otherwise the reason why it is not
         */
        Error.verify = function verify(message) {
            if (typeof message !== "object" || message === null)
                return "object expected";
            if (message.title != null && message.hasOwnProperty("title"))
                if (!$util.isString(message.title))
                    return "title: string expected";
            if (message.detail != null && message.hasOwnProperty("detail"))
                if (!$util.isString(message.detail))
                    return "detail: string expected";
            return null;
        };

        /**
         * Creates an Error message from a plain object. Also converts values to their respective internal types.
         * @function fromObject
         * @memberof HttpBasedResponse.Error
         * @static
         * @param {Object.<string,*>} object Plain object
         * @returns {HttpBasedResponse.Error} Error
         */
        Error.fromObject = function fromObject(object) {
            if (object instanceof $root.HttpBasedResponse.Error)
                return object;
            var message = new $root.HttpBasedResponse.Error();
            if (object.title != null)
                message.title = String(object.title);
            if (object.detail != null)
                message.detail = String(object.detail);
            return message;
        };

        /**
         * Creates a plain object from an Error message. Also converts values to other types if specified.
         * @function toObject
         * @memberof HttpBasedResponse.Error
         * @static
         * @param {HttpBasedResponse.Error} message Error
         * @param {$protobuf.IConversionOptions} [options] Conversion options
         * @returns {Object.<string,*>} Plain object
         */
        Error.toObject = function toObject(message, options) {
            if (!options)
                options = {};
            var object = {};
            if (options.defaults) {
                object.title = "";
                object.detail = "";
            }
            if (message.title != null && message.hasOwnProperty("title"))
                object.title = message.title;
            if (message.detail != null && message.hasOwnProperty("detail"))
                object.detail = message.detail;
            return object;
        };

        /**
         * Converts this Error to JSON.
         * @function toJSON
         * @memberof HttpBasedResponse.Error
         * @instance
         * @returns {Object.<string,*>} JSON object
         */
        Error.prototype.toJSON = function toJSON() {
            return this.constructor.toObject(this, $protobuf.util.toJSONOptions);
        };

        return Error;
    })();

    return HttpBasedResponse;
})();

module.exports = $root;
