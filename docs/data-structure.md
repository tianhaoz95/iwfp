---
id: data-structure-design-doc
title: Data Structure Design Doc
sidebar_label: DS Design
---

```json
{
  [
    uid: {
      info: {
        uid: "some unique id",
        username: "sample username",
        // more user information to be added
      },
      cards: {
        card_id: {
          card_id: "sample card id",
          promos: [
            {
              start_time: "9/1",
              end_time: "12/1",
              categories: [
                "amazon",
                ... // categories
              ],
              cash_back: 0.05
            },
            ... // promos
          ]
        },
        ... // cards
      }
    },
    ... // users
  ]
}
```