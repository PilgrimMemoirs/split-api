# SPLIT-API


## Endpoints

### Trips
- GET /trips
- GET /trips/:id
- POST /trips
  - params:
      - name: string
- PUT /trips/:id
- DELETE /trips/:id

### Bookings
  - GET /trips/:trip_id/bookings
  - GET /trips/:trip_id/bookings/:id
  - POST /trips/:trip_id/bookings
    - params:
        - nights: array, required
        - email: string, required
        - name: string, required
        - paid: boolean
        - cost: float
  - PUT /trips/:trip_id/bookings/:id
  - DELETE /trips/:trip_id/bookings/:id
