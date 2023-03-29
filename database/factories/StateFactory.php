<?php

namespace Database\Factories;

use App\Models\State;
use Illuminate\Database\Eloquent\Factories\Factory;

class StateFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = State::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        // $arabic_faker = Faker\Factory::create('ar_JO');
        $countries = \App\Models\countrie::pluck('id')->toArray();
        return [
           'countrie_id'=>$this->faker->randomElement($countries),
           'title'=>$this->faker->name(),
           'title_arabic'=>$this->faker->name(),
        ];
    }
}
