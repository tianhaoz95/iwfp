---
id: data-flow-design-doc
title: Data Flow Design Doc
sidebar_label: Data Flow Design
---

## Database Structure

```json
{
  [
    uid: {
      info: {
        uid: "some_unique_id",
        username: "sample_username",
        // more user information to be added
      },
      cards: {
        card_id: {
          card_id: "sample_card_id",
          promos: {
            promo_id: {
              promo_id: "sample_promo_id", 
              // should be unique within a card
              start_time: "9/1",
              end_time: "12/1",
              categories: [
                "amazon",
                ... // categories
              ],
              cash_back: 0.05
            },
            ... // promos
          }
        },
        ... // cards
      }
    },
    ... // users
  ]
}
```

## User

### Add a User

```json
{
  uid: "some_unique_id",
  username: "sample_username",
}
```

### Update a User

```json
{
  uid: "some_unique_id",
  username: "sample_username",
}
```

### Remove a User

```json
{
  uid: "some_unique_id"
}
```

## Cards

### Add a Card

```json
{
  card_id: "sample_card_id",
  promos: {}
}
```

### Remove a Card

```json
{
  card_id: "sample_card_id"
}
```

### Update a Card (Do I need it???)

```json
{
  card_id: "sample_card_id",
  update: {
    card_id: "update_card_id"
  }
}
```

## Promo

### Add promo

```json
{
  card_id: "sample_card_id",
  promo_id: "sample_promo_id",
  promo: {
    start_time: "9/1",
    end_time: "12/1",
    categories: [
      "amazon",
      ... // categories
    ],
    cash_back: 0.05
  }
}
```

### Remove a promo

```json
{
  card_id: "sample_card_id",
  promo_id: "sample_promo_id"
}
```

### Update a promo

```json
{
  card_id: "sample_card_id",
  promo_id: "sample_promo_id",
  promo: {
    start_time: "9/1",
    end_time: "12/1",
    categories: [
      "amazon",
      ... // categories
    ],
    cash_back: 0.05
  }
}
```