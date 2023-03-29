<?php

namespace Database\Factories;

use App\Models\City;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\DB;

class CityFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = City::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $states = \App\Models\state::pluck('id')->toArray();
        $state_id = $this->faker->randomElement($states);
        return [
                'state_id'=>$state_id,
                'countrie_id'=>DB::table('states')->find($state_id )->countrie_id,
                'title'=>$this->faker->name(),
                'title_arabic'=>$this->faker->name(),
            ];
    }
}
